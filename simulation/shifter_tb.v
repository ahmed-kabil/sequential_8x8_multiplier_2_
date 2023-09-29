module shifter_tb ();
reg [7:0]inp ;
reg [1:0]shift_cntrl ;
wire [15:0] shift_out ;

shifter UUT (
.inp(inp) ,
.shift_cntrl(shift_cntrl) ,
.shift_out(shift_out)
);

initial  begin
#5
inp = 8'b11000011 ; 
shift_cntrl = 2'b00 ; #20
shift_cntrl = 2'b01 ; #20
shift_cntrl = 2'b10 ; #20
shift_cntrl = 2'b11 ; #20 ;
end

endmodule
