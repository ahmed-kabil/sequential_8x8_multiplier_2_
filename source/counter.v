module counter (
input clk ,
input aclr_n ,
output reg [1:0]count_out
);

always @(posedge clk , negedge aclr_n)
  begin
    if(~aclr_n)
       count_out = 2'b0 ;
    else if (aclr_n)
       count_out = count_out +1 ;
  end

endmodule
