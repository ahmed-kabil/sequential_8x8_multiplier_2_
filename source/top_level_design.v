module top_level_design ( 
input clk ,
input [7:0]dataa ,
input [7:0]datab ,
input start ,
input reset_a ,
output done_flag ,
output [15:0]product8x8_out ,
output seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g
);

wire [1:0]sel, shift ;
wire [3:0]aout, bout ;
wire [7:0]product ;
wire [15:0]shift_out ;
wire [15:0]sum ;
wire sclr_n ;
wire clk_ena ;
wire [1:0]count ;
wire [2:0]state_out ;

///// instantiations //////
mux4 _mux4_1 (
  .mux_in_a(dataa[3:0]) ,
  .mux_in_b(dataa[7:4]) ,
  .mux_sel(sel[1]) ,
  .mux_out(aout)
);

mux4 _mux4_2 (
  .mux_in_a(datab[3:0]) ,
  .mux_in_b(datab[7:4]) ,
  .mux_sel(sel[0]) ,
  .mux_out(bout)
);

mult4x4 _mult4x4 (
  .dataa(aout) ,
  .datab(bout) ,
  .product(product)
);

shifter _shifter (
  .inp(product) ,
  .shift_cntrl(shift) ,
  .shift_out(shift_out)
);

adder _adder (
  .dataa(shift_out) ,
  .datab(product8x8_out) ,
  .sum(sum)
);

reg16 _reg16 (
  .clk(clk) ,
  .sclr_n(sclr_n) ,
  .clk_ena(clk_ena) ,
  .datain(sum) ,
  .reg_out(product8x8_out)
);

counter _counter (
  .clk(clk) ,
  .aclr_n(~start) ,
  .count_out(count)
);

seven_segment_cntrl _seven_segment_cntrl (
  .inp(state_out) ,
  .seg_a(seg_a) ,
  .seg_b(seg_b) ,
  .seg_c(seg_c) ,
  .seg_d(seg_d) ,
  .seg_e(seg_e) ,
  .seg_f(seg_f) ,
  .seg_g(seg_g)
);

mult_control _mult_control (
  .clk(clk) ,
  .reset_a(reset_a),
  .start(start) ,
  .count(count) ,
  .input_sel(sel) ,
  .shift_sel(shift) ,
  .state_out(state_out) ,
  .done(done_flag) ,
  .clk_ena(clk_ena) ,
  .sclr_n(sclr_n)
);

endmodule
