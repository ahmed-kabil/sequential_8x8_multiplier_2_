module mult_control_tb ();
reg clk , reset_a , start ;
reg [1:0]count ;
wire [1:0]input_sel , shift_sel ;
wire [2:0]state_out ;
wire done , clk_ena , sclr_n ;


mult_control UUT (
.clk(clk) ,
.reset_a(reset_a) ,
.start(start) ,
.count(count) ,
.input_sel(input_sel) ,
.shift_sel(shift_sel) ,
.state_out(state_out) ,
.done(done) ,
.clk_ena(clk_ena) ,
.sclr_n(sclr_n)
);

always  begin
clk = 1'b0 ; #10
clk = 1'b1 ; #10 ;
end

initial  begin
 reset_a = 1'b0 ; #20 
 reset_a = 1'b1 ; 
 start = 1'b1 ; #20
 start = 1'b0 ;
 count = 0 ; #20
 count = 1 ; #20
 count = 2 ; #20
 count = 3 ; #20
 #60 ;
end

endmodule
