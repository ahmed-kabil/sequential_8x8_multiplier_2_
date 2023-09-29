module adder_tb ();
reg [15:0]dataa, datab ; 
wire [15:0]sum ;

adder UUT (
.dataa(dataa),
.datab(datab),
.sum(sum)
);

initial begin
#5
 dataa = 200 ; datab = 300 ; #20
 dataa = 150 ; datab = 50 ; #20
 dataa = 100 ; datab = 150 ; #20
 dataa = 90 ; datab = 9 ; #20 ;
end

endmodule
