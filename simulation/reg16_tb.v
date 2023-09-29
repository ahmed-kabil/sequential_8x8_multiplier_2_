module reg16_tb ();
reg clk  ;
reg sclr_n ;
reg clk_ena ;
reg [15:0]datain ;
wire [15:0]reg_out ;

reg16 UUT (
.clk(clk) ,
.sclr_n(sclr_n) ,
.clk_ena(clk_ena) ,
.datain(datain) ,
.reg_out(reg_out)
);

always  begin
clk = 1'b0 ; #10
clk = 1'b1 ; #10 ;
end

initial  begin
datain = 16'd600 ; 
clk_ena = 1'b1 ;
sclr_n = 1'b0 ; # 15
clk_ena = 1'b0 ;
sclr_n = 1'b1 ; #40
clk_ena = 1'b1 ;
#40 ; $stop ;
end

endmodule
