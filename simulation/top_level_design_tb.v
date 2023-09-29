module top_level_design_tb ();
reg clk ;
reg [7:0]dataa ;
reg [7:0]datab ;
reg start ;
reg reset_a ;
wire done_flag ;
wire [15:0]product8x8_out ;
wire seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g ;


top_level_design UUT (
.clk(clk) ,
.dataa(dataa) ,
.datab(datab) ,
.start(start) ,
.reset_a(reset_a) ,
.done_flag(done_flag) ,
.product8x8_out(product8x8_out) ,
.seg_a(seg_a) ,
.seg_b(seg_b) ,
.seg_c(seg_c) ,
.seg_d(seg_d) ,
.seg_e(seg_e) ,
.seg_f(seg_f) ,
.seg_g(seg_g) 
);

always  begin
clk = 1'b0 ; #10
clk = 1'b1 ; #10 ;
end


 initial  begin
reset_a = 1'b0 ; #20
reset_a = 1'b1 ;

dataa = 100 ;  datab = 100 ;
start = 1'b1 ; #20
start = 1'b0 ; #100

dataa = 60 ;  datab = 200 ;
start = 1'b1 ; #20
start = 1'b0 ; #100

dataa = 12 ;  datab = 90 ;
start = 1'b1 ; #20
start = 1'b0 ; #100 

dataa = 44 ;  datab = 190 ;
start = 1'b1 ; #20
start = 1'b0 ; #60 
reset_a = 1'b0 ; #60
reset_a = 1'b1 ;

dataa = 65 ;  datab = 111 ;
start = 1'b1 ; #20
start = 1'b0 ; #100 ;

end

endmodule
