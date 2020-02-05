//
// Generated by Bluespec Compiler, version 2017.07.A (build 1da80f1, 2017-07-21)
//
// On Thu Feb  6 15:37:46 EST 2020
//
//
// Ports:
// Name                         I/O  size props
// RDY_set_verbosity              O     1 const
// RDY_req_reset                  O     1 const
// RDY_rsp_reset                  O     1 const
// valid                          O     1
// word                           O    64
// CLK                            I     1 clock
// RST_N                          I     1 reset
// set_verbosity_verbosity        I     4 reg
// req_is_OP_not_OP_32            I     1
// req_f3                         I     3
// req_v1                         I    64
// req_v2                         I    64
// EN_set_verbosity               I     1
// EN_req_reset                   I     1 unused
// EN_rsp_reset                   I     1 unused
// EN_req                         I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkRISCV_MBox(CLK,
		    RST_N,

		    set_verbosity_verbosity,
		    EN_set_verbosity,
		    RDY_set_verbosity,

		    EN_req_reset,
		    RDY_req_reset,

		    EN_rsp_reset,
		    RDY_rsp_reset,

		    req_is_OP_not_OP_32,
		    req_f3,
		    req_v1,
		    req_v2,
		    EN_req,

		    valid,

		    word);
  input  CLK;
  input  RST_N;

  // action method set_verbosity
  input  [3 : 0] set_verbosity_verbosity;
  input  EN_set_verbosity;
  output RDY_set_verbosity;

  // action method req_reset
  input  EN_req_reset;
  output RDY_req_reset;

  // action method rsp_reset
  input  EN_rsp_reset;
  output RDY_rsp_reset;

  // action method req
  input  req_is_OP_not_OP_32;
  input  [2 : 0] req_f3;
  input  [63 : 0] req_v1;
  input  [63 : 0] req_v2;
  input  EN_req;

  // value method valid
  output valid;

  // value method word
  output [63 : 0] word;

  // signals for module outputs
  wire [63 : 0] word;
  wire RDY_req_reset, RDY_rsp_reset, RDY_set_verbosity, valid;

  // inlined wires
  wire dw_valid$whas;

  // register cfg_verbosity
  reg [3 : 0] cfg_verbosity;
  wire [3 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;

  // register intDiv_rg_denom2
  reg [63 : 0] intDiv_rg_denom2;
  reg [63 : 0] intDiv_rg_denom2$D_IN;
  wire intDiv_rg_denom2$EN;

  // register intDiv_rg_denom_is_signed
  reg intDiv_rg_denom_is_signed;
  wire intDiv_rg_denom_is_signed$D_IN, intDiv_rg_denom_is_signed$EN;

  // register intDiv_rg_n
  reg [63 : 0] intDiv_rg_n;
  reg [63 : 0] intDiv_rg_n$D_IN;
  wire intDiv_rg_n$EN;

  // register intDiv_rg_numer_is_signed
  reg intDiv_rg_numer_is_signed;
  wire intDiv_rg_numer_is_signed$D_IN, intDiv_rg_numer_is_signed$EN;

  // register intDiv_rg_quo
  reg [63 : 0] intDiv_rg_quo;
  reg [63 : 0] intDiv_rg_quo$D_IN;
  wire intDiv_rg_quo$EN;

  // register intDiv_rg_quoIsNeg
  reg intDiv_rg_quoIsNeg;
  wire intDiv_rg_quoIsNeg$D_IN, intDiv_rg_quoIsNeg$EN;

  // register intDiv_rg_remIsNeg
  reg intDiv_rg_remIsNeg;
  wire intDiv_rg_remIsNeg$D_IN, intDiv_rg_remIsNeg$EN;

  // register intDiv_rg_state
  reg [2 : 0] intDiv_rg_state;
  reg [2 : 0] intDiv_rg_state$D_IN;
  wire intDiv_rg_state$EN;

  // register rg_f3
  reg [2 : 0] rg_f3;
  wire [2 : 0] rg_f3$D_IN;
  wire rg_f3$EN;

  // register rg_is_OP_not_OP_32
  reg rg_is_OP_not_OP_32;
  wire rg_is_OP_not_OP_32$D_IN, rg_is_OP_not_OP_32$EN;

  // register rg_result
  reg [63 : 0] rg_result;
  wire [63 : 0] rg_result$D_IN;
  wire rg_result$EN;

  // register rg_state
  reg [1 : 0] rg_state;
  wire [1 : 0] rg_state$D_IN;
  wire rg_state$EN;

  // register rg_v1
  reg [63 : 0] rg_v1;
  reg [63 : 0] rg_v1$D_IN;
  wire rg_v1$EN;

  // register rg_v2
  reg [63 : 0] rg_v2;
  wire [63 : 0] rg_v2$D_IN;
  wire rg_v2$EN;

  // ports of submodule intMul
  wire [127 : 0] intMul$result_value;
  wire [63 : 0] intMul$put_args_x, intMul$put_args_y;
  wire intMul$EN_put_args,
       intMul$put_args_x_is_signed,
       intMul$put_args_y_is_signed,
       intMul$result_valid;

  // rule scheduling signals
  wire CAN_FIRE_RL_intDiv_rl_loop1,
       CAN_FIRE_RL_intDiv_rl_loop2,
       CAN_FIRE_RL_intDiv_rl_start_div_by_zero,
       CAN_FIRE_RL_intDiv_rl_start_overflow,
       CAN_FIRE_RL_intDiv_rl_start_s,
       CAN_FIRE_RL_rg_div_rem,
       CAN_FIRE_RL_rl_mul,
       CAN_FIRE_req,
       CAN_FIRE_req_reset,
       CAN_FIRE_rsp_reset,
       CAN_FIRE_set_verbosity,
       WILL_FIRE_RL_intDiv_rl_loop1,
       WILL_FIRE_RL_intDiv_rl_loop2,
       WILL_FIRE_RL_intDiv_rl_start_div_by_zero,
       WILL_FIRE_RL_intDiv_rl_start_overflow,
       WILL_FIRE_RL_intDiv_rl_start_s,
       WILL_FIRE_RL_rg_div_rem,
       WILL_FIRE_RL_rl_mul,
       WILL_FIRE_req,
       WILL_FIRE_req_reset,
       WILL_FIRE_rsp_reset,
       WILL_FIRE_set_verbosity;

  // inputs to muxes for submodule ports
  wire [63 : 0] MUX_dw_result$wset_1__VAL_1,
		MUX_dw_result$wset_1__VAL_2,
		MUX_intDiv_rg_denom2$write_1__VAL_1,
		MUX_intDiv_rg_denom2$write_1__VAL_2,
		MUX_intDiv_rg_denom2$write_1__VAL_3,
		MUX_intDiv_rg_n$write_1__VAL_1,
		MUX_intDiv_rg_n$write_1__VAL_2,
		MUX_intDiv_rg_quo$write_1__VAL_1,
		MUX_rg_v1$write_1__VAL_2,
		MUX_rg_v1$write_1__VAL_3;
  wire MUX_intDiv_rg_denom2$write_1__SEL_1,
       MUX_intDiv_rg_denom2$write_1__SEL_2,
       MUX_intDiv_rg_quo$write_1__SEL_1,
       MUX_intDiv_rg_state$write_1__SEL_1,
       MUX_intDiv_rg_state$write_1__SEL_2,
       MUX_intDiv_rg_state$write_1__SEL_3,
       MUX_rg_v1$write_1__SEL_2;

  // remaining internal signals
  reg [31 : 0] v__h4522, v__h4528, v__h5321, v__h5327;
  wire [63 : 0] IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC___d129,
		IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC___d134,
		IF_rg_f3_3_BIT_1_19_THEN_rg_v1_ELSE_intDiv_rg__ETC___d120,
		_theResult_____1_fst__h5557,
		_theResult_____1_snd_fst__h5559,
		_theResult___fst__h5008,
		_theResult___fst__h5038,
		_theResult___fst__h5064,
		_theResult___fst__h815,
		_theResult___snd__h5009,
		_theResult___snd__h5039,
		_theResult___snd__h5065,
		_theResult___snd_fst__h810,
		denom___1__h757,
		numer___1__h756,
		result___1__h4801,
		result__h4568,
		v__h4450,
		v__h4492,
		x__h3983,
		x__h4069,
		x__h4139,
		x__h4154,
		y__h3862,
		y_avValue_fst__h5433,
		y_avValue_snd_fst__h5535;
  wire [31 : 0] IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC__q5,
		IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC__q6,
		IF_rg_f3_3_BIT_1_19_THEN_rg_v1_ELSE_intDiv_rg__ETC__q4,
		intMulresult_value_BITS_31_TO_0__q1,
		req_v1_BITS_31_TO_0__q2,
		req_v2_BITS_31_TO_0__q3;
  wire IF_intDiv_rg_numer_is_signed_THEN_rg_v1_BIT_63_ETC___d39,
       intDiv_rg_denom2_4_ULE_0_CONCAT_rg_v1_BITS_63__ETC___d47,
       rg_v1_ULT_intDiv_rg_denom2_4___d59,
       rg_v1_ULT_rg_v2___d55;

  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;
  assign CAN_FIRE_set_verbosity = 1'd1 ;
  assign WILL_FIRE_set_verbosity = EN_set_verbosity ;

  // action method req_reset
  assign RDY_req_reset = 1'd1 ;
  assign CAN_FIRE_req_reset = 1'd1 ;
  assign WILL_FIRE_req_reset = EN_req_reset ;

  // action method rsp_reset
  assign RDY_rsp_reset = 1'd1 ;
  assign CAN_FIRE_rsp_reset = 1'd1 ;
  assign WILL_FIRE_rsp_reset = EN_rsp_reset ;

  // action method req
  assign CAN_FIRE_req = 1'd1 ;
  assign WILL_FIRE_req = EN_req ;

  // value method valid
  assign valid = dw_valid$whas ;

  // value method word
  assign word =
	     WILL_FIRE_RL_rl_mul ?
	       MUX_dw_result$wset_1__VAL_1 :
	       MUX_dw_result$wset_1__VAL_2 ;

  // submodule intMul
  mkIntMul_64 intMul(.CLK(CLK),
		     .RST_N(RST_N),
		     .put_args_x(intMul$put_args_x),
		     .put_args_x_is_signed(intMul$put_args_x_is_signed),
		     .put_args_y(intMul$put_args_y),
		     .put_args_y_is_signed(intMul$put_args_y_is_signed),
		     .EN_put_args(intMul$EN_put_args),
		     .result_valid(intMul$result_valid),
		     .result_value(intMul$result_value));

  // rule RL_rl_mul
  assign CAN_FIRE_RL_rl_mul = rg_state == 2'd0 && intMul$result_valid ;
  assign WILL_FIRE_RL_rl_mul = CAN_FIRE_RL_rl_mul ;

  // rule RL_rg_div_rem
  assign CAN_FIRE_RL_rg_div_rem =
	     rg_state == 2'd2 && intDiv_rg_state == 3'd4 ;
  assign WILL_FIRE_RL_rg_div_rem = CAN_FIRE_RL_rg_div_rem ;

  // rule RL_intDiv_rl_start_div_by_zero
  assign CAN_FIRE_RL_intDiv_rl_start_div_by_zero =
	     intDiv_rg_state == 3'd1 && rg_v2 == 64'd0 ;
  assign WILL_FIRE_RL_intDiv_rl_start_div_by_zero =
	     CAN_FIRE_RL_intDiv_rl_start_div_by_zero ;

  // rule RL_intDiv_rl_start_overflow
  assign CAN_FIRE_RL_intDiv_rl_start_overflow =
	     intDiv_rg_state == 3'd1 && intDiv_rg_numer_is_signed &&
	     rg_v1 == 64'h8000000000000000 &&
	     intDiv_rg_denom_is_signed &&
	     rg_v2 == 64'hFFFFFFFFFFFFFFFF ;
  assign WILL_FIRE_RL_intDiv_rl_start_overflow =
	     CAN_FIRE_RL_intDiv_rl_start_overflow ;

  // rule RL_intDiv_rl_start_s
  assign CAN_FIRE_RL_intDiv_rl_start_s =
	     intDiv_rg_state == 3'd1 && rg_v2 != 64'd0 &&
	     (!intDiv_rg_numer_is_signed || rg_v1 != 64'h8000000000000000 ||
	      !intDiv_rg_denom_is_signed ||
	      rg_v2 != 64'hFFFFFFFFFFFFFFFF) ;
  assign WILL_FIRE_RL_intDiv_rl_start_s = CAN_FIRE_RL_intDiv_rl_start_s ;

  // rule RL_intDiv_rl_loop1
  assign CAN_FIRE_RL_intDiv_rl_loop1 = intDiv_rg_state == 3'd2 ;
  assign WILL_FIRE_RL_intDiv_rl_loop1 = CAN_FIRE_RL_intDiv_rl_loop1 ;

  // rule RL_intDiv_rl_loop2
  assign CAN_FIRE_RL_intDiv_rl_loop2 = intDiv_rg_state == 3'd3 ;
  assign WILL_FIRE_RL_intDiv_rl_loop2 = CAN_FIRE_RL_intDiv_rl_loop2 ;

  // inputs to muxes for submodule ports
  assign MUX_intDiv_rg_denom2$write_1__SEL_1 =
	     WILL_FIRE_RL_intDiv_rl_loop1 &&
	     intDiv_rg_denom2_4_ULE_0_CONCAT_rg_v1_BITS_63__ETC___d47 ;
  assign MUX_intDiv_rg_denom2$write_1__SEL_2 =
	     WILL_FIRE_RL_intDiv_rl_loop2 && !rg_v1_ULT_rg_v2___d55 &&
	     rg_v1_ULT_intDiv_rg_denom2_4___d59 ;
  assign MUX_intDiv_rg_quo$write_1__SEL_1 =
	     WILL_FIRE_RL_intDiv_rl_loop2 &&
	     (rg_v1_ULT_rg_v2___d55 && intDiv_rg_quoIsNeg ||
	      !rg_v1_ULT_rg_v2___d55 && !rg_v1_ULT_intDiv_rg_denom2_4___d59) ;
  assign MUX_intDiv_rg_state$write_1__SEL_1 = EN_req && req_f3[2] ;
  assign MUX_intDiv_rg_state$write_1__SEL_2 =
	     WILL_FIRE_RL_intDiv_rl_loop2 && rg_v1_ULT_rg_v2___d55 ;
  assign MUX_intDiv_rg_state$write_1__SEL_3 =
	     WILL_FIRE_RL_intDiv_rl_loop1 &&
	     !intDiv_rg_denom2_4_ULE_0_CONCAT_rg_v1_BITS_63__ETC___d47 ;
  assign MUX_rg_v1$write_1__SEL_2 =
	     WILL_FIRE_RL_intDiv_rl_loop2 &&
	     (rg_v1_ULT_rg_v2___d55 && intDiv_rg_remIsNeg ||
	      !rg_v1_ULT_rg_v2___d55 && !rg_v1_ULT_intDiv_rg_denom2_4___d59) ;
  assign MUX_dw_result$wset_1__VAL_1 =
	     (rg_is_OP_not_OP_32 && rg_f3 == 3'b0) ?
	       intMul$result_value[63:0] :
	       v__h4450 ;
  assign MUX_dw_result$wset_1__VAL_2 =
	     rg_is_OP_not_OP_32 ?
	       IF_rg_f3_3_BIT_1_19_THEN_rg_v1_ELSE_intDiv_rg__ETC___d120 :
	       result___1__h4801 ;
  assign MUX_intDiv_rg_denom2$write_1__VAL_1 =
	     { intDiv_rg_denom2[62:0], 1'd0 } ;
  assign MUX_intDiv_rg_denom2$write_1__VAL_2 =
	     { 1'd0, intDiv_rg_denom2[63:1] } ;
  assign MUX_intDiv_rg_denom2$write_1__VAL_3 =
	     (intDiv_rg_numer_is_signed && intDiv_rg_denom_is_signed) ?
	       denom___1__h757 :
	       _theResult___snd_fst__h810 ;
  assign MUX_intDiv_rg_n$write_1__VAL_1 = { intDiv_rg_n[62:0], 1'd0 } ;
  assign MUX_intDiv_rg_n$write_1__VAL_2 = { 1'd0, intDiv_rg_n[63:1] } ;
  assign MUX_intDiv_rg_quo$write_1__VAL_1 =
	     rg_v1_ULT_rg_v2___d55 ? x__h4069 : x__h4154 ;
  assign MUX_rg_v1$write_1__VAL_2 =
	     rg_v1_ULT_rg_v2___d55 ? x__h4139 : x__h3983 ;
  assign MUX_rg_v1$write_1__VAL_3 =
	     intDiv_rg_numer_is_signed ? numer___1__h756 : rg_v1 ;

  // inlined wires
  assign dw_valid$whas = WILL_FIRE_RL_rg_div_rem || WILL_FIRE_RL_rl_mul ;

  // register cfg_verbosity
  assign cfg_verbosity$D_IN = set_verbosity_verbosity ;
  assign cfg_verbosity$EN = EN_set_verbosity ;

  // register intDiv_rg_denom2
  always@(MUX_intDiv_rg_denom2$write_1__SEL_1 or
	  MUX_intDiv_rg_denom2$write_1__VAL_1 or
	  MUX_intDiv_rg_denom2$write_1__SEL_2 or
	  MUX_intDiv_rg_denom2$write_1__VAL_2 or
	  WILL_FIRE_RL_intDiv_rl_start_s or
	  MUX_intDiv_rg_denom2$write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_intDiv_rg_denom2$write_1__SEL_1:
	  intDiv_rg_denom2$D_IN = MUX_intDiv_rg_denom2$write_1__VAL_1;
      MUX_intDiv_rg_denom2$write_1__SEL_2:
	  intDiv_rg_denom2$D_IN = MUX_intDiv_rg_denom2$write_1__VAL_2;
      WILL_FIRE_RL_intDiv_rl_start_s:
	  intDiv_rg_denom2$D_IN = MUX_intDiv_rg_denom2$write_1__VAL_3;
      default: intDiv_rg_denom2$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign intDiv_rg_denom2$EN =
	     WILL_FIRE_RL_intDiv_rl_loop1 &&
	     intDiv_rg_denom2_4_ULE_0_CONCAT_rg_v1_BITS_63__ETC___d47 ||
	     WILL_FIRE_RL_intDiv_rl_loop2 && !rg_v1_ULT_rg_v2___d55 &&
	     rg_v1_ULT_intDiv_rg_denom2_4___d59 ||
	     WILL_FIRE_RL_intDiv_rl_start_s ;

  // register intDiv_rg_denom_is_signed
  assign intDiv_rg_denom_is_signed$D_IN = !req_f3[0] ;
  assign intDiv_rg_denom_is_signed$EN = MUX_intDiv_rg_state$write_1__SEL_1 ;

  // register intDiv_rg_n
  always@(MUX_intDiv_rg_denom2$write_1__SEL_1 or
	  MUX_intDiv_rg_n$write_1__VAL_1 or
	  MUX_intDiv_rg_denom2$write_1__SEL_2 or
	  MUX_intDiv_rg_n$write_1__VAL_2 or WILL_FIRE_RL_intDiv_rl_start_s)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_intDiv_rg_denom2$write_1__SEL_1:
	  intDiv_rg_n$D_IN = MUX_intDiv_rg_n$write_1__VAL_1;
      MUX_intDiv_rg_denom2$write_1__SEL_2:
	  intDiv_rg_n$D_IN = MUX_intDiv_rg_n$write_1__VAL_2;
      WILL_FIRE_RL_intDiv_rl_start_s: intDiv_rg_n$D_IN = 64'd1;
      default: intDiv_rg_n$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign intDiv_rg_n$EN =
	     WILL_FIRE_RL_intDiv_rl_loop1 &&
	     intDiv_rg_denom2_4_ULE_0_CONCAT_rg_v1_BITS_63__ETC___d47 ||
	     WILL_FIRE_RL_intDiv_rl_loop2 && !rg_v1_ULT_rg_v2___d55 &&
	     rg_v1_ULT_intDiv_rg_denom2_4___d59 ||
	     WILL_FIRE_RL_intDiv_rl_start_s ;

  // register intDiv_rg_numer_is_signed
  assign intDiv_rg_numer_is_signed$D_IN = !req_f3[0] ;
  assign intDiv_rg_numer_is_signed$EN = MUX_intDiv_rg_state$write_1__SEL_1 ;

  // register intDiv_rg_quo
  always@(MUX_intDiv_rg_quo$write_1__SEL_1 or
	  MUX_intDiv_rg_quo$write_1__VAL_1 or
	  WILL_FIRE_RL_intDiv_rl_start_overflow or
	  rg_v1 or
	  WILL_FIRE_RL_intDiv_rl_start_s or
	  WILL_FIRE_RL_intDiv_rl_start_div_by_zero)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_intDiv_rg_quo$write_1__SEL_1:
	  intDiv_rg_quo$D_IN = MUX_intDiv_rg_quo$write_1__VAL_1;
      WILL_FIRE_RL_intDiv_rl_start_overflow: intDiv_rg_quo$D_IN = rg_v1;
      WILL_FIRE_RL_intDiv_rl_start_s: intDiv_rg_quo$D_IN = 64'd0;
      WILL_FIRE_RL_intDiv_rl_start_div_by_zero:
	  intDiv_rg_quo$D_IN = 64'hFFFFFFFFFFFFFFFF;
      default: intDiv_rg_quo$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign intDiv_rg_quo$EN =
	     MUX_intDiv_rg_quo$write_1__SEL_1 ||
	     WILL_FIRE_RL_intDiv_rl_start_overflow ||
	     WILL_FIRE_RL_intDiv_rl_start_s ||
	     WILL_FIRE_RL_intDiv_rl_start_div_by_zero ;

  // register intDiv_rg_quoIsNeg
  assign intDiv_rg_quoIsNeg$D_IN =
	     (intDiv_rg_numer_is_signed && intDiv_rg_denom_is_signed) ?
	       rg_v1[63] != rg_v2[63] :
	       IF_intDiv_rg_numer_is_signed_THEN_rg_v1_BIT_63_ETC___d39 ;
  assign intDiv_rg_quoIsNeg$EN = CAN_FIRE_RL_intDiv_rl_start_s ;

  // register intDiv_rg_remIsNeg
  assign intDiv_rg_remIsNeg$D_IN =
	     (intDiv_rg_numer_is_signed && intDiv_rg_denom_is_signed) ?
	       rg_v1[63] :
	       intDiv_rg_numer_is_signed && rg_v1[63] ;
  assign intDiv_rg_remIsNeg$EN = CAN_FIRE_RL_intDiv_rl_start_s ;

  // register intDiv_rg_state
  always@(MUX_intDiv_rg_state$write_1__SEL_1 or
	  MUX_intDiv_rg_state$write_1__SEL_2 or
	  MUX_intDiv_rg_state$write_1__SEL_3 or
	  WILL_FIRE_RL_intDiv_rl_start_s or
	  WILL_FIRE_RL_intDiv_rl_start_overflow or
	  WILL_FIRE_RL_intDiv_rl_start_div_by_zero)
  case (1'b1)
    MUX_intDiv_rg_state$write_1__SEL_1: intDiv_rg_state$D_IN = 3'd1;
    MUX_intDiv_rg_state$write_1__SEL_2: intDiv_rg_state$D_IN = 3'd4;
    MUX_intDiv_rg_state$write_1__SEL_3: intDiv_rg_state$D_IN = 3'd3;
    WILL_FIRE_RL_intDiv_rl_start_s: intDiv_rg_state$D_IN = 3'd2;
    WILL_FIRE_RL_intDiv_rl_start_overflow ||
    WILL_FIRE_RL_intDiv_rl_start_div_by_zero:
	intDiv_rg_state$D_IN = 3'd4;
    default: intDiv_rg_state$D_IN = 3'b010 /* unspecified value */ ;
  endcase
  assign intDiv_rg_state$EN =
	     WILL_FIRE_RL_intDiv_rl_loop2 && rg_v1_ULT_rg_v2___d55 ||
	     EN_req && req_f3[2] ||
	     WILL_FIRE_RL_intDiv_rl_loop1 &&
	     !intDiv_rg_denom2_4_ULE_0_CONCAT_rg_v1_BITS_63__ETC___d47 ||
	     WILL_FIRE_RL_intDiv_rl_start_s ||
	     WILL_FIRE_RL_intDiv_rl_start_overflow ||
	     WILL_FIRE_RL_intDiv_rl_start_div_by_zero ;

  // register rg_f3
  assign rg_f3$D_IN = req_f3 ;
  assign rg_f3$EN = EN_req ;

  // register rg_is_OP_not_OP_32
  assign rg_is_OP_not_OP_32$D_IN = req_is_OP_not_OP_32 ;
  assign rg_is_OP_not_OP_32$EN = EN_req ;

  // register rg_result
  assign rg_result$D_IN = 64'h0 ;
  assign rg_result$EN = 1'b0 ;

  // register rg_state
  assign rg_state$D_IN = req_f3[2] ? 2'd2 : 2'd0 ;
  assign rg_state$EN = EN_req ;

  // register rg_v1
  always@(EN_req or
	  IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC___d129 or
	  MUX_rg_v1$write_1__SEL_2 or
	  MUX_rg_v1$write_1__VAL_2 or
	  WILL_FIRE_RL_intDiv_rl_start_s or
	  MUX_rg_v1$write_1__VAL_3 or WILL_FIRE_RL_intDiv_rl_start_overflow)
  case (1'b1)
    EN_req:
	rg_v1$D_IN =
	    IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC___d129;
    MUX_rg_v1$write_1__SEL_2: rg_v1$D_IN = MUX_rg_v1$write_1__VAL_2;
    WILL_FIRE_RL_intDiv_rl_start_s: rg_v1$D_IN = MUX_rg_v1$write_1__VAL_3;
    WILL_FIRE_RL_intDiv_rl_start_overflow: rg_v1$D_IN = 64'd0;
    default: rg_v1$D_IN = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
  endcase
  assign rg_v1$EN =
	     MUX_rg_v1$write_1__SEL_2 || WILL_FIRE_RL_intDiv_rl_start_s ||
	     EN_req ||
	     WILL_FIRE_RL_intDiv_rl_start_overflow ;

  // register rg_v2
  assign rg_v2$D_IN =
	     EN_req ?
	       IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC___d134 :
	       MUX_intDiv_rg_denom2$write_1__VAL_3 ;
  assign rg_v2$EN = WILL_FIRE_RL_intDiv_rl_start_s || EN_req ;

  // submodule intMul
  assign intMul$put_args_x =
	     (req_is_OP_not_OP_32 &&
	      (req_f3 == 3'b0 || req_f3 == 3'b001 || req_f3 == 3'b011 ||
	       req_f3 == 3'b010)) ?
	       IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC___d129 :
	       y_avValue_fst__h5433 ;
  assign intMul$put_args_x_is_signed =
	     (!req_is_OP_not_OP_32 || req_f3 != 3'b0) &&
	     (!req_is_OP_not_OP_32 || req_f3 != 3'b011) ;
  assign intMul$put_args_y =
	     (req_is_OP_not_OP_32 &&
	      (req_f3 == 3'b0 || req_f3 == 3'b001 || req_f3 == 3'b011 ||
	       req_f3 == 3'b010)) ?
	       IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC___d134 :
	       y_avValue_snd_fst__h5535 ;
  assign intMul$put_args_y_is_signed =
	     (!req_is_OP_not_OP_32 || req_f3 != 3'b0) &&
	     (!req_is_OP_not_OP_32 || req_f3 != 3'b011) &&
	     (!req_is_OP_not_OP_32 || req_f3 != 3'b010) ;
  assign intMul$EN_put_args = EN_req && !req_f3[2] ;

  // remaining internal signals
  assign IF_intDiv_rg_numer_is_signed_THEN_rg_v1_BIT_63_ETC___d39 =
	     intDiv_rg_numer_is_signed ?
	       rg_v1[63] :
	       intDiv_rg_denom_is_signed && rg_v2[63] ;
  assign IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC___d129 =
	     req_is_OP_not_OP_32 ? req_v1 : _theResult___fst__h5008 ;
  assign IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC__q5 =
	     IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC___d129[31:0] ;
  assign IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC___d134 =
	     req_is_OP_not_OP_32 ? req_v2 : _theResult___snd__h5009 ;
  assign IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC__q6 =
	     IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC___d134[31:0] ;
  assign IF_rg_f3_3_BIT_1_19_THEN_rg_v1_ELSE_intDiv_rg__ETC___d120 =
	     rg_f3[1] ? rg_v1 : intDiv_rg_quo ;
  assign IF_rg_f3_3_BIT_1_19_THEN_rg_v1_ELSE_intDiv_rg__ETC__q4 =
	     IF_rg_f3_3_BIT_1_19_THEN_rg_v1_ELSE_intDiv_rg__ETC___d120[31:0] ;
  assign _theResult_____1_fst__h5557 =
	     { {32{IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC__q5[31]}},
	       IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC__q5 } ;
  assign _theResult_____1_snd_fst__h5559 =
	     { {32{IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC__q6[31]}},
	       IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC__q6 } ;
  assign _theResult___fst__h5008 =
	     req_f3[0] ? _theResult___fst__h5064 : _theResult___fst__h5038 ;
  assign _theResult___fst__h5038 =
	     { {32{req_v1_BITS_31_TO_0__q2[31]}}, req_v1_BITS_31_TO_0__q2 } ;
  assign _theResult___fst__h5064 = { 32'd0, req_v1[31:0] } ;
  assign _theResult___fst__h815 =
	     intDiv_rg_denom_is_signed ? denom___1__h757 : rg_v2 ;
  assign _theResult___snd__h5009 =
	     req_f3[0] ? _theResult___snd__h5065 : _theResult___snd__h5039 ;
  assign _theResult___snd__h5039 =
	     { {32{req_v2_BITS_31_TO_0__q3[31]}}, req_v2_BITS_31_TO_0__q3 } ;
  assign _theResult___snd__h5065 = { 32'd0, req_v2[31:0] } ;
  assign _theResult___snd_fst__h810 =
	     intDiv_rg_numer_is_signed ? rg_v2 : _theResult___fst__h815 ;
  assign denom___1__h757 = rg_v2[63] ? -rg_v2 : rg_v2 ;
  assign intDiv_rg_denom2_4_ULE_0_CONCAT_rg_v1_BITS_63__ETC___d47 =
	     intDiv_rg_denom2 <= y__h3862 ;
  assign intMulresult_value_BITS_31_TO_0__q1 = intMul$result_value[31:0] ;
  assign numer___1__h756 = rg_v1[63] ? x__h4139 : rg_v1 ;
  assign req_v1_BITS_31_TO_0__q2 = req_v1[31:0] ;
  assign req_v2_BITS_31_TO_0__q3 = req_v2[31:0] ;
  assign result___1__h4801 =
	     { {32{IF_rg_f3_3_BIT_1_19_THEN_rg_v1_ELSE_intDiv_rg__ETC__q4[31]}},
	       IF_rg_f3_3_BIT_1_19_THEN_rg_v1_ELSE_intDiv_rg__ETC__q4 } ;
  assign result__h4568 =
	     { {32{intMulresult_value_BITS_31_TO_0__q1[31]}},
	       intMulresult_value_BITS_31_TO_0__q1 } ;
  assign rg_v1_ULT_intDiv_rg_denom2_4___d59 = rg_v1 < intDiv_rg_denom2 ;
  assign rg_v1_ULT_rg_v2___d55 = rg_v1 < rg_v2 ;
  assign v__h4450 =
	     (rg_is_OP_not_OP_32 &&
	      (rg_f3 == 3'b001 || rg_f3 == 3'b011 || rg_f3 == 3'b010)) ?
	       intMul$result_value[127:64] :
	       v__h4492 ;
  assign v__h4492 =
	     (!rg_is_OP_not_OP_32 && rg_f3 == 3'b0) ? result__h4568 : 64'd0 ;
  assign x__h3983 = rg_v1 - intDiv_rg_denom2 ;
  assign x__h4069 = -intDiv_rg_quo ;
  assign x__h4139 = -rg_v1 ;
  assign x__h4154 = intDiv_rg_quo + intDiv_rg_n ;
  assign y__h3862 = { 1'd0, rg_v1[63:1] } ;
  assign y_avValue_fst__h5433 =
	     (!req_is_OP_not_OP_32 && req_f3 == 3'b0) ?
	       _theResult_____1_fst__h5557 :
	       IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC___d129 ;
  assign y_avValue_snd_fst__h5535 =
	     (!req_is_OP_not_OP_32 && req_f3 == 3'b0) ?
	       _theResult_____1_snd_fst__h5559 :
	       IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC___d134 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	intDiv_rg_state <= `BSV_ASSIGNMENT_DELAY 3'd0;
      end
    else
      begin
        if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
	if (intDiv_rg_state$EN)
	  intDiv_rg_state <= `BSV_ASSIGNMENT_DELAY intDiv_rg_state$D_IN;
      end
    if (intDiv_rg_denom2$EN)
      intDiv_rg_denom2 <= `BSV_ASSIGNMENT_DELAY intDiv_rg_denom2$D_IN;
    if (intDiv_rg_denom_is_signed$EN)
      intDiv_rg_denom_is_signed <= `BSV_ASSIGNMENT_DELAY
	  intDiv_rg_denom_is_signed$D_IN;
    if (intDiv_rg_n$EN) intDiv_rg_n <= `BSV_ASSIGNMENT_DELAY intDiv_rg_n$D_IN;
    if (intDiv_rg_numer_is_signed$EN)
      intDiv_rg_numer_is_signed <= `BSV_ASSIGNMENT_DELAY
	  intDiv_rg_numer_is_signed$D_IN;
    if (intDiv_rg_quo$EN)
      intDiv_rg_quo <= `BSV_ASSIGNMENT_DELAY intDiv_rg_quo$D_IN;
    if (intDiv_rg_quoIsNeg$EN)
      intDiv_rg_quoIsNeg <= `BSV_ASSIGNMENT_DELAY intDiv_rg_quoIsNeg$D_IN;
    if (intDiv_rg_remIsNeg$EN)
      intDiv_rg_remIsNeg <= `BSV_ASSIGNMENT_DELAY intDiv_rg_remIsNeg$D_IN;
    if (rg_f3$EN) rg_f3 <= `BSV_ASSIGNMENT_DELAY rg_f3$D_IN;
    if (rg_is_OP_not_OP_32$EN)
      rg_is_OP_not_OP_32 <= `BSV_ASSIGNMENT_DELAY rg_is_OP_not_OP_32$D_IN;
    if (rg_result$EN) rg_result <= `BSV_ASSIGNMENT_DELAY rg_result$D_IN;
    if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
    if (rg_v1$EN) rg_v1 <= `BSV_ASSIGNMENT_DELAY rg_v1$D_IN;
    if (rg_v2$EN) rg_v2 <= `BSV_ASSIGNMENT_DELAY rg_v2$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cfg_verbosity = 4'hA;
    intDiv_rg_denom2 = 64'hAAAAAAAAAAAAAAAA;
    intDiv_rg_denom_is_signed = 1'h0;
    intDiv_rg_n = 64'hAAAAAAAAAAAAAAAA;
    intDiv_rg_numer_is_signed = 1'h0;
    intDiv_rg_quo = 64'hAAAAAAAAAAAAAAAA;
    intDiv_rg_quoIsNeg = 1'h0;
    intDiv_rg_remIsNeg = 1'h0;
    intDiv_rg_state = 3'h2;
    rg_f3 = 3'h2;
    rg_is_OP_not_OP_32 = 1'h0;
    rg_result = 64'hAAAAAAAAAAAAAAAA;
    rg_state = 2'h2;
    rg_v1 = 64'hAAAAAAAAAAAAAAAA;
    rg_v2 = 64'hAAAAAAAAAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_mul && (!rg_is_OP_not_OP_32 || rg_f3 != 3'b0) &&
	  (!rg_is_OP_not_OP_32 || rg_f3 != 3'b001) &&
	  (!rg_is_OP_not_OP_32 || rg_f3 != 3'b011) &&
	  (!rg_is_OP_not_OP_32 || rg_f3 != 3'b010) &&
	  (rg_is_OP_not_OP_32 || rg_f3 != 3'b0))
	begin
	  v__h4528 = $stime;
	  #0;
	end
    v__h4522 = v__h4528 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_mul && (!rg_is_OP_not_OP_32 || rg_f3 != 3'b0) &&
	  (!rg_is_OP_not_OP_32 || rg_f3 != 3'b001) &&
	  (!rg_is_OP_not_OP_32 || rg_f3 != 3'b011) &&
	  (!rg_is_OP_not_OP_32 || rg_f3 != 3'b010) &&
	  (rg_is_OP_not_OP_32 || rg_f3 != 3'b0))
	$display("%0d: ERROR: RISCV_MBox.rl_mul: illegal f3. again",
		 v__h4522);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !req_f3[2] && (!req_is_OP_not_OP_32 || req_f3 != 3'b0) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b001) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b011) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b010) &&
	  (req_is_OP_not_OP_32 || req_f3 != 3'b0))
	begin
	  v__h5327 = $stime;
	  #0;
	end
    v__h5321 = v__h5327 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !req_f3[2] && (!req_is_OP_not_OP_32 || req_f3 != 3'b0) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b001) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b011) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b010) &&
	  (req_is_OP_not_OP_32 || req_f3 != 3'b0))
	$display("%0d: ERROR: RISCV_MBox.rl_mul: illegal f3.", v__h5321);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !req_f3[2] && (!req_is_OP_not_OP_32 || req_f3 != 3'b0) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b001) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b011) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b010) &&
	  (req_is_OP_not_OP_32 || req_f3 != 3'b0))
	$display("    f3 0x%0h  v1 0x%0h  v2 0x%0h",
		 req_f3,
		 IF_req_is_OP_not_OP_32_THEN_req_v1_ELSE_IF_req_ETC___d129,
		 IF_req_is_OP_not_OP_32_THEN_req_v2_ELSE_IF_req_ETC___d134);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !req_f3[2] && (!req_is_OP_not_OP_32 || req_f3 != 3'b0) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b001) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b011) &&
	  (!req_is_OP_not_OP_32 || req_f3 != 3'b010) &&
	  (req_is_OP_not_OP_32 || req_f3 != 3'b0))
	$finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkRISCV_MBox

