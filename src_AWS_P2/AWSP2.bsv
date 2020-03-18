
import BRAMFIFO     :: *;
import BuildVector  :: *;
import ClientServer :: *;
import Connectable  :: *;
import FIFO         :: *;
import FIFOF        :: *;
import GetPut       :: *;
import Vector       :: *;

import ConnectalConfig :: *;
import ConnectalMemTypes::*;

// ================================================================
// Project imports

import P2_Core  :: *;
import SoC_Map  :: *;

// The basic core
import Core_IFC :: *;
import Core     :: *;

// External interrupt request interface
import PLIC :: *;    // for PLIC_Source_IFC type which is exposed at P2_Core interface

// Main Fabric
import AXI4_Types   :: *;
import AXI4_Fabric  :: *;
import Fabric_Defs  :: *;

`ifdef INCLUDE_TANDEM_VERIF
import TV_Info :: *;
import AXI4_Stream ::*;
`endif

`ifdef INCLUDE_GDB_CONTROL
import Debug_Module :: *;
import JtagTap      :: *;
import Giraffe_IFC  :: *;
`endif

import AWSP2_IFC   :: *;

interface AWSP2;
  interface AWSP2_Request request;
  interface Vector#(1, MemReadClient#(DataBusWidth)) readClients;
  interface Vector#(1, MemWriteClient#(DataBusWidth)) writeClients;
`ifdef BOARD_awsf1
   interface AWSP2_Pin_IFC pins;
`endif
endinterface

   Fabric_Addr ddr4_0_uncached_addr_base = 'h_8000_0000;
   Fabric_Addr ddr4_0_uncached_addr_size = 'h_4000_0000;    // 1G
   Fabric_Addr ddr4_0_uncached_addr_lim  = ddr4_0_uncached_addr_base + ddr4_0_uncached_addr_size;

   Fabric_Addr ddr4_0_cached_addr_base = 'h_C000_0000;
   Fabric_Addr ddr4_0_cached_addr_size = 'h_4000_0000;    // 1G
   Fabric_Addr ddr4_0_cached_addr_lim  = ddr4_0_cached_addr_base + ddr4_0_cached_addr_size;

(* synthesize *)
module mkAXI4_Fabric_2x2(AXI4_Fabric_IFC#(2, 2, 4, 64, 64, 0));

    function Tuple2 #(Bool, Bit #(TLog #(2))) fn_addr_to_slave_num(Bit #(64) addr);
	if ((ddr4_0_uncached_addr_base <= addr) && (addr < ddr4_0_uncached_addr_lim)) begin
	   return tuple2(True, 0);
	end
	else if ((ddr4_0_cached_addr_base <= addr) && (addr < ddr4_0_cached_addr_lim)) begin
	   return tuple2(True, 0);
	end
	else begin
	   return tuple2(True, 1);
	end
    endfunction

   AXI4_Fabric_IFC#(2, 2, 4, 64, 64, 0) axiFabric <- mkAXI4_Fabric(fn_addr_to_slave_num);

   method reset = axiFabric.reset;
   method set_verbosity = axiFabric.set_verbosity;
   interface v_from_masters = axiFabric.v_from_masters;
   interface v_to_slaves = axiFabric.v_to_slaves;
endmodule

module mkAWSP2#(AWSP2_Response response)(AWSP2);

   P2_Core_IFC p2_core <- mkP2_Core();

   Reg#(Bit#(4)) rg_verbosity <- mkReg(0);
   Reg#(Bool) rg_ready <- mkReg(False);

   Vector#(16, Reg#(Bit#(8)))    objIds <- replicateM(mkReg(0));

   // FIXME: add boot ROM slave interface
`define USE_FABRIC_2X2
`ifdef USE_FABRIC_2X2
   AXI4_Fabric_IFC#(2, 2, 4, 64, 64, 0) axiFabric <- mkAXI4_Fabric_2x2();
   mkConnection(p2_core.master0, axiFabric.v_from_masters[0]);
   mkConnection(p2_core.master1, axiFabric.v_from_masters[1]);
   let to_slave0 = axiFabric.v_to_slaves[0];
   let to_slave1 = axiFabric.v_to_slaves[1];
`else
   let to_slave0 = p2_core.master0;
   let to_slave1 = p2_core.master1;
`endif

   FIFOF#(MemRequest) readReqFifo0 <- mkFIFOF();
   FIFOF#(MemRequest) writeReqFifo0 <- mkFIFOF();
   FIFOF#(MemData#(DataBusWidth))   readDataFifo0 <- mkSizedBRAMFIFOF(64);
   FIFOF#(MemData#(DataBusWidth))   writeDataFifo0 <- mkSizedBRAMFIFOF(64);
   FIFOF#(Bit#(MemTagSize)) doneFifo0 <- mkFIFOF();

   Wire#(Bool) w_arready0 <- mkDWire(False);
   Wire#(Bool) w_awready0 <- mkDWire(False);
   Wire#(Bool) w_wready0  <- mkDWire(False);
   Wire#(Bool) w_rready0  <- mkDWire(False);
   Wire#(Bool) w_rvalid0  <- mkDWire(False);

   FIFOF#(MemRequest) readReqFifo1 <- mkFIFOF();
   FIFOF#(MemRequest) writeReqFifo1 <- mkFIFOF();
   FIFOF#(MemData#(64)) readDataFifo1 <- mkSizedBRAMFIFOF(64);
   FIFOF#(MemData#(64)) writeDataFifo1 <- mkSizedBRAMFIFOF(64);
   FIFOF#(Bit#(MemTagSize)) doneFifo1 <- mkFIFOF();

   Wire#(Bool) w_arready1 <- mkDWire(False);
   Wire#(Bool) w_awready1 <- mkDWire(False);
   Wire#(Bool) w_wready1  <- mkDWire(False);
   Wire#(Bool) w_rready1  <- mkDWire(False);
   Wire#(Bool) w_rvalid1  <- mkDWire(False);

//`ifndef BOARD_awsf1
   rule master0_handshake;
      to_slave0.m_awready(w_awready0);
      to_slave0.m_arready(w_arready0);
      to_slave0.m_wready(w_wready0);
   endrule

   rule debug0 if (False);
      if (to_slave0.m_arvalid()
         || w_arready0
         || w_rvalid0
         || to_slave0.m_rready())
         if (rg_verbosity > 0) $display("master0 arvalid %d arready %d rvalid %d rready %d", to_slave0.m_arvalid(), w_arready0, w_rvalid0, to_slave0.m_rready());
   endrule

   rule master0_aw if (rg_ready);
      if (to_slave0.m_awvalid()) begin
          let awaddr = to_slave0.m_awaddr();
          let len    = to_slave0.m_awlen();
          let size   = to_slave0.m_awsize();
          let awid   = to_slave0.m_awid();

          Bit#(4)  objNumber = truncate(awaddr >> 28);
          Bit#(28) objOffset = truncate(awaddr);
          let objId = objIds[objNumber];
          let burstLen = 8 * (len + 1);
          if (rg_verbosity > 0) $display("master0 awaddr %h len=%d size=%d id=%d objId=%d objOffset=%h burstLen=%d", awaddr, len, size, awid, objId, objOffset, burstLen);
          writeReqFifo0.enq(MemRequest { sglId: extend(objId), offset: extend(objOffset), burstLen: extend(burstLen), tag: extend(awid) });
      end
      w_awready0 <= writeReqFifo0.notFull();
   endrule

   rule master0_wdata if (rg_ready);
      if (to_slave0.m_wvalid()) begin
          let wdata = to_slave0.m_wdata;
          let wstrb = to_slave0.m_wstrb;
          let wlast = to_slave0.m_wlast;
          if (rg_verbosity > 0) $display("master0 wdata %h wstrb %h", wdata, wstrb);
          writeDataFifo0.enq(MemData { data: wdata, tag: 0, byte_enables: wstrb, last: wlast});
       end
       w_wready0 <= writeDataFifo0.notFull();
    endrule

   rule master0_b if (rg_ready);
      let bvalid = doneFifo0.notEmpty();
      let bid    = doneFifo0.first();
      let bresp = 0;
      let buser = 0;
      to_slave0.m_bvalid(bvalid, truncate(bid), bresp, buser);
      if (to_slave0.m_bready()) begin
          doneFifo0.deq();
      end
   endrule

   rule master0_ar if (rg_ready);
      if (to_slave0.m_arvalid()) begin
          let araddr = to_slave0.m_araddr();
          let len    = to_slave0.m_arlen();
          let size   = to_slave0.m_arsize();
          let arid   = to_slave0.m_arid();

          Bit#(4) objNumber = truncate(araddr >> 28);
          Bit#(28) objOffset = truncate(araddr);

          let objId = objIds[objNumber];
          let burstLen = 8 * (len + 1);
          if (rg_verbosity > 0) $display("master0 araddr %h len=%d size=%d id=%d objId=%d objOffset=%h", araddr, len, size, arid, objId, objOffset);
          readReqFifo0.enq(MemRequest { sglId: extend(objId), offset: extend(objOffset), burstLen: extend(burstLen), tag: extend(arid) });
      end
      w_arready0 <= readReqFifo0.notFull();

   endrule

   rule master0_rdata if (rg_ready);
      let rdata = readDataFifo0.first;
      if (rg_verbosity > 0) $display("master0 rdata data %h rid %d last %d", rdata.data, rdata.tag, rdata.last);

      w_rvalid0 <= readDataFifo0.notEmpty();
      to_slave0.m_rvalid(readDataFifo0.notEmpty(),
                               truncate(rdata.tag),
                               rdata.data,
                               0,  // rresp
                               rdata.last,
                               0); // ruser


      if (to_slave0.m_rready()) begin
          //$display("master0_rdata_deq rvalid %d rready %d", w_rvalid0, to_slave0.m_rready());
         readDataFifo0.deq();
      end
   endrule
//`endif

   rule master1_handshake;
      to_slave1.m_awready(w_awready1);
      to_slave1.m_arready(w_arready1);
      to_slave1.m_wready(w_wready1);
   endrule

   rule debug1 if (False);
      if (to_slave1.m_arvalid()
         || w_arready1
         || w_rvalid1
         || to_slave1.m_rready())
         $display("master1 arvalid %d arready %d rvalid %d rready %d", to_slave1.m_arvalid(), w_arready1, w_rvalid1, to_slave1.m_rready());
   endrule

   rule master1_aw if (rg_ready);
      if (to_slave1.m_awvalid()) begin
          let awaddr = to_slave1.m_awaddr();
          let len    = to_slave1.m_awlen();
          let size   = to_slave1.m_awsize();
          let awid   = to_slave1.m_awid();

          Bit#(4)  objNumber = truncate(awaddr >> 28);
          Bit#(28) objOffset = truncate(awaddr);
          let objId = objIds[objNumber];
          let burstLen = 8 * (len + 1);
          $display("master1 awaddr %h len=%d size=%d id=%d objId=%d objOffset=%h burstLen=%d", awaddr, len, size, awid, objId, objOffset, burstLen);
          writeReqFifo1.enq(MemRequest { sglId: extend(objId), offset: extend(objOffset), burstLen: extend(burstLen), tag: extend(awid) });
      end
      w_awready1 <= writeReqFifo1.notFull();
   endrule

   rule master1_wdata if (rg_ready);
      if (to_slave1.m_wvalid()) begin
          let wdata = to_slave1.m_wdata;
          let wstrb = to_slave1.m_wstrb;
          let wlast = to_slave1.m_wlast;
          $display("master1 wdata %h wstrb %h", wdata, wstrb);
          writeDataFifo1.enq(MemData { data: wdata, tag: 1, byte_enables: wstrb, last: wlast});
       end
       w_wready1 <= writeDataFifo1.notFull();
    endrule

   rule master1_b if (rg_ready);
      let bvalid = doneFifo1.notEmpty();
      let bid    = doneFifo1.first();
      let bresp = 0;
      let buser = 0;
      to_slave1.m_bvalid(bvalid, truncate(bid), bresp, buser);
      if (to_slave1.m_bready()) begin
          doneFifo1.deq();
      end
   endrule

   rule master1_ar if (rg_ready);
      if (to_slave1.m_arvalid()) begin
          let araddr = to_slave1.m_araddr();
          let len    = to_slave1.m_arlen();
          let size   = to_slave1.m_arsize();
          let arid   = to_slave1.m_arid();

          Bit#(4) objNumber = truncate(araddr >> 28);
          Bit#(28) objOffset = truncate(araddr);

          let objId = objIds[objNumber];
          let burstLen = 8 * (len + 1);
          $display("master1 araddr %h len=%d size=%d id=%d objId=%d objOffset=%h", araddr, len, size, arid, objId, objOffset);
          readReqFifo1.enq(MemRequest { sglId: extend(objId), offset: extend(objOffset), burstLen: extend(burstLen), tag: extend(arid) });
      end
      w_arready1 <= readReqFifo1.notFull();

   endrule

   rule master1_rdata if (rg_ready);
      let rdata = readDataFifo1.first;
      $display("master1 rdata data %h rid %d last %d", rdata.data, rdata.tag, rdata.last);

      w_rvalid1 <= readDataFifo1.notEmpty();
      to_slave1.m_rvalid(readDataFifo1.notEmpty(),
                               truncate(rdata.tag),
                               rdata.data,
                               0,  // rresp
                               rdata.last,
                               0); // ruser

      if (to_slave1.m_rready()) begin
          //$display("master1_rdata_deq rvalid %d rready %d", w_rvalid1, to_slave1.m_rready());
         readDataFifo1.deq();
      end
   endrule

   rule master1_io_araddr;
       let req <- toGet(readReqFifo1).get();
       response.io_araddr(truncate(req.offset), extend(req.burstLen), extend(req.tag));
   endrule
   rule master1_io_awaddr;
       let req <- toGet(writeReqFifo1).get();
       response.io_awaddr(truncate(req.offset), extend(req.burstLen), extend(req.tag));
   endrule
   rule master1_io_wdata;
       let mdata <- toGet(writeDataFifo1).get();
       response.io_wdata(mdata.data, 0);
   endrule

`ifdef INCLUDE_GDB_CONTROL
   rule dmi_rsp;
      let rdata <- p2_core.dmi.read_data();
      response.dmi_read_data(rdata);
   endrule
`endif

`ifdef INCLUDE_TANDEM_VERIF
   Reg#(Bool) rg_capture_tv_info <- mkReg(False);
   let tvFifo <- mkFIFOF();
   rule tv_out;
      if (p2_core.tv_verifier_info_tx.m_tvalid() && rg_capture_tv_info) begin
	  let tv_bits = p2_core.tv_verifier_info_tx.m_tdata();
	  let tv_strb = p2_core.tv_verifier_info_tx.m_tstrb();
          tvFifo.enq(tv_bits);
      end
      p2_core.tv_verifier_info_tx.m_tready(tvFifo.notFull());
   endrule
   rule tv_ready;
      let tv_bits <- toGet(tvFifo).get();
      Info_CPU_to_Verifier info = unpack(tv_bits);
      response.tandem_packet(info.num_bytes, info.vec_bytes);
   endrule
`endif

   MemReadClient#(DataBusWidth) readClient0 = (interface MemReadClient;
      interface Get readReq = toGet(readReqFifo0);
      interface Put readData;
        method Action put(MemData#(DataBusWidth) rdata);
          readDataFifo0.enq(rdata);
        endmethod
      endinterface
   endinterface );
   MemWriteClient#(DataBusWidth) writeClient0 = (interface MemWriteClient;
      interface Get writeReq = toGet(writeReqFifo0);
      interface Get writeData = toGet(writeDataFifo0);
      interface Put writeDone = toPut(doneFifo0);
   endinterface );

   interface AWSP2_Request request;
      method Action dmi_read(Bit#(7) addr);
`ifdef INCLUDE_GDB_CONTROL
         p2_core.dmi.read_addr(addr);
`else
         //response.dmi_read_data('hbeef);
`endif
      endmethod
      method Action dmi_write(Bit#(7) addr, Bit#(32) data);
`ifdef INCLUDE_GDB_CONTROL
         p2_core.dmi.write(addr, data);
`endif
      endmethod
      method Action register_region(Bit#(32) region, Bit#(32) objectId);
         objIds[region] <= truncate(objectId);
      endmethod
      method Action memory_ready();
          if (rg_verbosity > 0) $display("memory_ready");
          rg_ready <= True;
      endmethod
      method Action capture_tv_info(Bool c);
`ifdef INCLUDE_TANDEM_VERIF
         rg_capture_tv_info <= c;
`endif
      endmethod

      method Action io_rdata(Bit#(64) data, Bit#(16) rid, Bit#(8) rresp, Bool last);
         readDataFifo1.enq(MemData { data: data, tag: truncate(rid), last: last });
      endmethod
      method Action io_bdone(Bit#(16) bid, Bit#(8) bresp);
         doneFifo1.enq(truncate(bid));
      endmethod
   endinterface

   interface readClients = vec(readClient0);
   interface writeClients = vec(writeClient0);

`ifdef BOARD_awsf1
   interface AWSP2_Pin_IFC pins;
      interface ddr = to_slave0;
   endinterface
`endif

endmodule
