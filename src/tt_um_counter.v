`define default_netname none

module tt_um_counter (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  // assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  // assign uio_out = 0;
  // assign uio_oe  = 0;		
  
    counter #(.bits(4)) c1 (.clk(uio_in[7]), .rst(uio_in[6]), .select(uio_in[4]), .count(uio_out[3:0]));

    assign uio_oe = 8'b00001111;
    assign uio_out[4] = 1'b0;
    assign uio_out[5] = 1'b0;
    assign uio_out[6] = 1'b0;
    assign uio_out[7] = 1'b0;
    assign uo_out[7:0] = 8'b00000000;
   		     
endmodule

    counter #(.bits(4)) c1 (.clk(uio_in[7]), .rst(uio_in[6]), .select(uio_in[5]), .count(uio_out[3:0]));
                         
    assign uio_oe = 8'b00001111;
    assign uio_out[7:4] = 4'b0000;
    assign uo_out[7:0] = 8'b00000000;

endmodule

    counter #(.bits(4)) c1 (.clk(clk), .rst(~rst_n), .select(ui_in[0]), .count(uo_out[3:0]));
    assign uio_oe = 8'b00000000;
    assign uio_out[7:0] = 8'b00000000;
    assign uo_out[7:4] = 4'b0000;

endmodule