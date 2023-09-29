module mult4x4_tb ();
reg [3:0]dataa , datab ;
wire [7:0]product ;

mult4x4 UUT (
.dataa(dataa) ,
.datab(datab) ,
.product(product)
);

initial begin
#5
 dataa = 2 ; datab = 3 ; #20
 dataa = 10 ; datab = 5 ; #20
 dataa = 7 ; datab = 4 ; #20
 dataa = 14 ; datab = 9 ; #20 ;
end

endmodule
