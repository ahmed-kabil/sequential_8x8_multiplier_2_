module seven_segment_cntrl_tb ();
reg [2:0]inp ;
wire seg_a ;
wire seg_b ;
wire seg_c ;
wire seg_d ;
wire seg_e ;
wire seg_f ;
wire seg_g ;

seven_segment_cntrl UUT (
.inp(inp) ,
.seg_a(seg_a) ,
.seg_b(seg_b) ,
.seg_c(seg_c) ,
.seg_d(seg_d) ,
.seg_e(seg_e) ,
.seg_f(seg_f) ,
.seg_g(seg_g) 
);

initial  begin
#5
inp = 0 ; #20
inp = 1 ; #20
inp = 2 ; #20
inp = 3 ; #20
inp = 4 ; #20
inp = 5 ; #20
inp = 6 ; #20
inp = 7 ; #20 ;
end

endmodule
