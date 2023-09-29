module mux4_tb ();
reg [3:0]mux_in_a , mux_in_b ;
reg mux_sel ;
wire [3:0] mux_out ;

mux4 UUT (
.mux_in_a(mux_in_a) ,
.mux_in_b(mux_in_b) ,
.mux_sel(mux_sel) ,
.mux_out(mux_out)
);

initial  begin
#5
mux_in_a = 5 ;
mux_in_b = 7 ;
mux_sel = 0 ; #20
mux_sel = 1 ; #20
mux_sel = 0 ; #20
mux_sel = 1 ; #20
mux_in_a = 15 ;
mux_in_b = 10 ;
mux_sel = 0 ; #20
mux_sel = 1 ; #20
mux_sel = 0 ; #20
mux_sel = 1 ; #20 ;
end

endmodule
