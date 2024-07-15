`timescale 1ns / 1ps

module d_flip_flop (
    input wire clk,
    input wire rst,
    input wire d,
    output reg q
);

always @(posedge clk or posedge rst ) begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

module siso_register (
    input wire clk,
    input wire rst,
    input wire serial_in,
    output wire serial_out
);

wire q1, q2, q3, q4;

// Instantiate four D flip-flops
d_flip_flop dff1 (.clk(clk), .rst(rst), .d(serial_in), .q(q1));
d_flip_flop dff2 (.clk(clk), .rst(rst), .d(q1), .q(q2));
d_flip_flop dff3 (.clk(clk), .rst(rst), .d(q2), .q(q3));
d_flip_flop dff4 (.clk(clk), .rst(rst), .d(q3), .q(q4));

// Output of the last flip-flop is the serial output
assign serial_out = q4;

endmodule
