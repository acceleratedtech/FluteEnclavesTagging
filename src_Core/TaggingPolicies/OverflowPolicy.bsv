// This BSV file was generated by Hardware Security Compiler (HSC),
// from the policy called `OverflowPolicy`.

import DefaultValue :: *;
import Vector       :: *;

import ISA_Decls       :: *;
import TagMonitor_IFC  :: *;

instance DefaultValue#(Struct2);
    defaultValue = Struct2 { unknown_tag: False, signed_overflow: False, unsigned_overflow: False };
endinstance

typedef struct { Struct2 a; Struct2 aa;  } Struct1 deriving(Eq, Bits);
typedef struct { Bool unknown_tag; Bool signed_overflow; Bool unsigned_overflow;  } Struct2 deriving(Eq, Bits, FShow);
typedef struct { Bool a; Bit#(XLEN) aa; Bit#(XLEN) aaa; Bit#(XLEN) aaaa; Bit#(XLEN) aaaaa; Bit#(XLEN) aaaaaa; Bit#(XLEN) aaaaaaa; Bit#(XLEN) aaaaaaaa; Bit#(XLEN) aaaaaaaaa; Struct4 aaaaaaaaaa; Struct4 aaaaaaaaaaa; Bit#(XLEN) aaaaaaaaaaaa;  } Struct3 deriving(Eq, Bits);
typedef struct { Bit#(XLEN) data; Struct2 tag;  } Struct4 deriving(Eq, Bits);
typedef struct { Bool a; Bit#(XLEN) aa; Bit#(XLEN) aaa; Bit#(XLEN) aaaa; Bit#(XLEN) aaaaa; Bit#(XLEN) aaaaaa; Bit#(XLEN) aaaaaaa; Bit#(XLEN) aaaaaaaa; Bit#(XLEN) aaaaaaaaa; Bit#(XLEN) aaaaaaaaaa;  } Struct5 deriving(Eq, Bits);
typedef struct { Bool a; Bit#(XLEN) aa; Bit#(XLEN) aaa; Bit#(XLEN) aaaa; Bit#(XLEN) aaaaa; Bit#(XLEN) aaaaaa; Bit#(XLEN) aaaaaaa; Bit#(XLEN) aaaaaaaa; Bit#(XLEN) aaaaaaaaa; Struct4 aaaaaaaaaa;  } Struct6 deriving(Eq, Bits);
typedef struct { Bool a; Bit#(XLEN) aa; Bit#(XLEN) aaa; Bit#(XLEN) aaaa; Bit#(XLEN) aaaaa; Bit#(XLEN) aaaaaa; Bit#(XLEN) aaaaaaa; Bit#(XLEN) aaaaaaaa; Bit#(XLEN) aaaaaaaaa; Struct4 aaaaaaaaaa; Bit#(XLEN) aaaaaaaaaaa;  } Struct7 deriving(Eq, Bits);

interface Module1;
    method Struct2 default_overflow_op (Struct1 x_0);
    
endinterface

module mkModule1 (Module1);
    
    // No rules in this module
    
    method Struct2 default_overflow_op (Struct1 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Struct2 x_2 = ((x_0).a);
        Struct2 x_3 = ((x_0).aa);
        Struct2 x_4 = (Struct2 {unknown_tag : ((x_2).unknown_tag) ||
        ((x_3).unknown_tag), signed_overflow : ((x_2).signed_overflow) ||
        ((x_3).signed_overflow), unsigned_overflow :
        ((x_2).unsigned_overflow) || ((x_3).unsigned_overflow)});
        return x_4;
    endmethod
    
endmodule

interface Module2;
    method Struct2 alu_add (Struct3 x_0);
    method Struct2 alu_addw (Struct3 x_0);
    method Struct2 alu_sub (Struct3 x_0);
    method Struct2 alu_subw (Struct3 x_0);
    method Struct2 alu_and (Struct3 x_0);
    method Struct2 alu_or (Struct3 x_0);
    method Struct2 alu_xor (Struct3 x_0);
    method Struct2 alu_slt (Struct3 x_0);
    method Struct2 alu_sltu (Struct3 x_0);
    method Struct2 alu_sll (Struct3 x_0);
    method Struct2 alu_sllw (Struct3 x_0);
    method Struct2 alu_srl (Struct3 x_0);
    method Struct2 alu_sra (Struct3 x_0);
    method Struct2 alu_srlw (Struct3 x_0);
    method Struct2 alu_sraw (Struct3 x_0);
    method Struct2 default_tag_op (Struct3 x_0);
    method Struct2 unknown_tag (Struct5 x_0);
    method Struct2 pc_tag (Struct5 x_0);
    method Struct2 constant_tag (Struct5 x_0);
    method Bool is_legal_next_pc (Struct6 x_0);
    method Bool is_legal_store_address (Struct7 x_0);
    method Bool is_legal_load_address (Struct7 x_0);
    
endinterface


module
  mkModule2#(function Struct2 default_overflow_op(Struct1 _))
  (Module2);
    
    // No rules in this module
    
    method Struct2 alu_add (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        let x_17 = ?;
        if ((x_13) < ((x_11).data)) begin
        
            Struct2 x_16 = (Struct2 {unknown_tag : (x_15).unknown_tag,
            signed_overflow : (x_15).signed_overflow, unsigned_overflow :
            (Bool)'(True)});
            x_17 = x_16;
        end else begin
        x_17 = x_15;
        end
        Struct2 x_18 = (x_17);
        let x_20 = ?;
        if ((! (((((x_11).data)[63:63]) < (((x_12).data)[63:63])) ||
        ((((x_12).data)[63:63]) < (((x_11).data)[63:63])))) &&
        (((((x_11).data)[63:63]) < ((x_13)[63:63])) || (((x_13)[63:63]) <
        (((x_11).data)[63:63])))) begin
        
            Struct2 x_19 = (Struct2 {unknown_tag : (x_18).unknown_tag,
            signed_overflow : (Bool)'(True), unsigned_overflow :
            (x_18).unsigned_overflow});
            x_20 = x_19;
        end else begin
        x_20 = x_18;
        end
        Struct2 x_21 = (x_20);
        return x_21;
    endmethod
    
    method Struct2 alu_addw (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        let x_17 = ?;
        if (((x_13)[31:0]) < (((x_11).data)[31:0])) begin
        
            Struct2 x_16 = (Struct2 {unknown_tag : (x_15).unknown_tag,
            signed_overflow : (x_15).signed_overflow, unsigned_overflow :
            (Bool)'(True)});
            x_17 = x_16;
        end else begin
        x_17 = x_15;
        end
        Struct2 x_18 = (x_17);
        let x_20 = ?;
        if ((! (((((x_11).data)[31:31]) < (((x_12).data)[31:31])) ||
        ((((x_12).data)[31:31]) < (((x_11).data)[31:31])))) &&
        (((((x_11).data)[31:31]) < ((x_13)[31:31])) || (((x_13)[31:31]) <
        (((x_11).data)[31:31])))) begin
        
            Struct2 x_19 = (Struct2 {unknown_tag : (x_18).unknown_tag,
            signed_overflow : (Bool)'(True), unsigned_overflow :
            (x_18).unsigned_overflow});
            x_20 = x_19;
        end else begin
        x_20 = x_18;
        end
        Struct2 x_21 = (x_20);
        return x_21;
    endmethod
    
    method Struct2 alu_sub (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        let x_17 = ?;
        if ((! ((x_13) < ((x_11).data))) && (((x_11).data) < (x_13))) begin
        
            Struct2 x_16 = (Struct2 {unknown_tag : (x_15).unknown_tag,
            signed_overflow : (x_15).signed_overflow, unsigned_overflow :
            (Bool)'(True)});
            x_17 = x_16;
        end else begin
        x_17 = x_15;
        end
        Struct2 x_18 = (x_17);
        let x_20 = ?;
        if ((! (((((x_11).data)[63:63]) < (~(((x_12).data)[63:63]))) ||
        ((~(((x_12).data)[63:63])) < (((x_11).data)[63:63])))) &&
        (((((x_11).data)[63:63]) < ((x_13)[63:63])) || (((x_13)[63:63]) <
        (((x_11).data)[63:63])))) begin
        
            Struct2 x_19 = (Struct2 {unknown_tag : (x_18).unknown_tag,
            signed_overflow : (Bool)'(True), unsigned_overflow :
            (x_18).unsigned_overflow});
            x_20 = x_19;
        end else begin
        x_20 = x_18;
        end
        Struct2 x_21 = (x_20);
        return x_21;
    endmethod
    
    method Struct2 alu_subw (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        let x_17 = ?;
        if ((! (((x_13)[31:0]) < (((x_11).data)[31:0]))) &&
        ((((x_11).data)[31:0]) < ((x_13)[31:0]))) begin
        
            Struct2 x_16 = (Struct2 {unknown_tag : (x_15).unknown_tag,
            signed_overflow : (x_15).signed_overflow, unsigned_overflow :
            (Bool)'(True)});
            x_17 = x_16;
        end else begin
        x_17 = x_15;
        end
        Struct2 x_18 = (x_17);
        let x_20 = ?;
        if ((! (((((x_11).data)[31:31]) < (~(((x_12).data)[31:31]))) ||
        ((~(((x_12).data)[31:31])) < (((x_11).data)[31:31])))) &&
        (((((x_11).data)[31:31]) < ((x_13)[31:31])) || (((x_13)[31:31]) <
        (((x_11).data)[31:31])))) begin
        
            Struct2 x_19 = (Struct2 {unknown_tag : (x_18).unknown_tag,
            signed_overflow : (Bool)'(True), unsigned_overflow :
            (x_18).unsigned_overflow});
            x_20 = x_19;
        end else begin
        x_20 = x_18;
        end
        Struct2 x_21 = (x_20);
        return x_21;
    endmethod
    
    method Struct2 alu_and (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_or (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_xor (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_slt (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_sltu (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_sll (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_sllw (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_srl (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_sra (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_srlw (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 alu_sraw (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 default_tag_op (Struct3 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Struct4 x_12 = ((x_0).aaaaaaaaaaa);
        Bit#(XLEN) x_13 = ((x_0).aaaaaaaaaaaa);
        let x_14 = default_overflow_op(Struct1 {a : (x_11).tag, aa :
        (x_12).tag});
        Struct2 x_15 = (x_14);
        return x_15;
    endmethod
    
    method Struct2 unknown_tag (Struct5 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Bit#(XLEN) x_11 = ((x_0).aaaaaaaaaa);
        Struct2 x_12 = (Struct2 {unknown_tag : (Bool)'(True), signed_overflow
        : (Bool)'(False), unsigned_overflow : (Bool)'(False)});
        return x_12;
    endmethod
    
    method Struct2 pc_tag (Struct5 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Bit#(XLEN) x_11 = ((x_0).aaaaaaaaaa);
        Struct2 x_12 = (Struct2 {unknown_tag : (Bool)'(False),
        signed_overflow : (Bool)'(False), unsigned_overflow :
        (Bool)'(False)});
        return x_12;
    endmethod
    
    method Struct2 constant_tag (Struct5 x_0);
        Struct2 x_1 =
        ((Struct2)'(Struct2 {unknown_tag: False, signed_overflow: False, unsigned_overflow: False}));
        
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Bit#(XLEN) x_11 = ((x_0).aaaaaaaaaa);
        Struct2 x_12 = (Struct2 {unknown_tag : (Bool)'(False),
        signed_overflow : (Bool)'(False), unsigned_overflow :
        (Bool)'(False)});
        return x_12;
    endmethod
    
    method Bool is_legal_next_pc (Struct6 x_0);
        Bool x_1 = ((Bool)'(False));
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Bool x_12 = (((! (x_2)) || (((x_11).tag).unknown_tag) ?
        ((Bool)'(True)) : ((! (((x_11).tag).signed_overflow)) && (!
        (((x_11).tag).unsigned_overflow)))));
        return x_12;
    endmethod
    
    method Bool is_legal_store_address (Struct7 x_0);
        Bool x_1 = ((Bool)'(False));
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Bit#(XLEN) x_12 = ((x_0).aaaaaaaaaaa);
        Bool x_13 = (((! (x_2)) || (((x_11).tag).unknown_tag) ?
        ((Bool)'(True)) : ((! (((x_11).tag).signed_overflow)) && (!
        (((x_11).tag).unsigned_overflow)))));
        return x_13;
    endmethod
    
    method Bool is_legal_load_address (Struct7 x_0);
        Bool x_1 = ((Bool)'(False));
        Bool x_2 = ((x_0).a);
        Bit#(XLEN) x_3 = ((x_0).aa);
        Bit#(XLEN) x_4 = ((x_0).aaa);
        Bit#(XLEN) x_5 = ((x_0).aaaa);
        Bit#(XLEN) x_6 = ((x_0).aaaaa);
        Bit#(XLEN) x_7 = ((x_0).aaaaaa);
        Bit#(XLEN) x_8 = ((x_0).aaaaaaa);
        Bit#(XLEN) x_9 = ((x_0).aaaaaaaa);
        Bit#(XLEN) x_10 = ((x_0).aaaaaaaaa);
        Struct4 x_11 = ((x_0).aaaaaaaaaa);
        Bit#(XLEN) x_12 = ((x_0).aaaaaaaaaaa);
        Bool x_13 = (((! (x_2)) || (((x_11).tag).unknown_tag) ?
        ((Bool)'(True)) : ((! (((x_11).tag).signed_overflow)) && (!
        (((x_11).tag).unsigned_overflow)))));
        return x_13;
    endmethod
    
endmodule

interface OverflowPolicy;
    interface Module2 policy;
endinterface

module mkOverflowPolicy (OverflowPolicy);
    Module1 m1 <- mkModule1 ();
    Module2 m2 <- mkModule2 (m1.default_overflow_op);
    interface policy = m2;
endmodule
