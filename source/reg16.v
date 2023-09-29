module reg16 (
input clk ,
input sclr_n ,
input clk_ena,
input [15:0]datain ,
output reg [15:0]reg_out
);

always @(posedge clk)
  begin
    if (~clk_ena)
      reg_out = reg_out ;
    else if (clk_ena)
      begin
        if(~sclr_n)
           reg_out = 16'b0 ;
        else if(sclr_n)
           reg_out = datain ;
      end
      
  end
endmodule
