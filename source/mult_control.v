module mult_control (
input clk ,
input reset_a ,
input start ,
input [1:0]count ,
output reg [1:0]input_sel ,
output reg [1:0]shift_sel ,
output [2:0]state_out ,
output reg done ,
output reg clk_ena ,
output reg sclr_n
);

localparam IDLE = 0 , LSB = 1 , MID = 2 , MSB = 3 , CALC_DONE = 4 , ERR = 5 ;
reg [2:0] state_reg , state_next ;

always @( posedge clk , negedge reset_a)
  begin
    if(~reset_a)
       state_reg = IDLE ;
    else
       state_reg = state_next ;
  end

always@(*)
  begin
    case(state_reg)
      IDLE : begin
               if(start)
                  begin
                    state_next = LSB ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 0 ;
                    clk_ena = 1 ;
                    sclr_n = 0 ;
                  end
               else if(~start)
                  begin
                    state_next = IDLE ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 0 ;
                    clk_ena = 0 ;
                    sclr_n = 1 ;
                  end
             end

      LSB : begin
               if(~start & count==0)
                  begin
                    state_next = MID ;
                    input_sel = 2'b00 ;
                    shift_sel = 2'b00 ;
                    done = 0 ;
                    clk_ena = 1 ;
                    sclr_n = 1 ;
                  end
               else
                  begin
                    state_next = ERR ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 0 ;
                    clk_ena = 0 ;
                    sclr_n = 1 ;
                  end
             end

      MID : begin
               if(~start & count==1)
                  begin
                    state_next = MID ;
                    input_sel = 2'b01 ;
                    shift_sel = 2'b01 ;
                    done = 0 ;
                    clk_ena = 1 ;
                    sclr_n = 1 ;
                  end
               else if(~start & count==2)
                  begin
                    state_next = MSB ;
                    input_sel = 2'b10 ;
                    shift_sel = 2'b01 ;
                    done = 0 ;
                    clk_ena = 1 ;
                    sclr_n = 1 ;
                  end
               else
                  begin
                    state_next = ERR ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 0 ;
                    clk_ena = 0 ;
                    sclr_n = 1 ;
                  end
             end

      MSB : begin
               if(~start & count==3)
                  begin
                    state_next = CALC_DONE ;
                    input_sel = 2'b11 ;
                    shift_sel = 2'b10 ;
                    done = 0 ;
                    clk_ena = 1 ;
                    sclr_n = 1 ;
                  end
               else
                  begin
                    state_next = ERR ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 0 ;
                    clk_ena = 0 ;
                    sclr_n = 1 ;
                  end
             end

      CALC_DONE : begin
               if(~start)
                  begin
                    state_next = IDLE ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 1 ;
                    clk_ena = 0 ;
                    sclr_n = 1 ;
                  end
               else if(start)
                  begin
                    state_next = ERR ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 0 ;
                    clk_ena = 0 ;
                    sclr_n = 1 ;
                  end
             end

      ERR : begin
               if(~start)
                  begin
                    state_next = ERR ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 0 ;
                    clk_ena = 0 ;
                    sclr_n = 1 ;
                  end
               else if(start)
                  begin
                    state_next = LSB ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 0 ;
                    clk_ena = 1 ;
                    sclr_n = 0 ;
                  end
             end

      default :  begin
                    state_next = ERR ;
                    input_sel = 2'bxx ;
                    shift_sel = 2'bxx ;
                    done = 0 ;
                    clk_ena = 0 ;
                    sclr_n = 1 ;
                 end

    endcase
  end
assign state_out = state_reg ;
endmodule
