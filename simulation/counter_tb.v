module counter_tb ();
reg clk ;
reg aclr_n ;
wire [1:0]count_out ;

counter UUT (
.clk(clk) ,
.aclr_n(aclr_n) ,
.count_out(count_out)
);

always  begin
clk = 1'b0 ; #10
clk = 1'b1 ; #10 ;
end

initial  begin
aclr_n = 1'b0 ; #2
aclr_n = 1'b1 ; #80
aclr_n = 1'b0 ; #10 ;
end

endmodule
