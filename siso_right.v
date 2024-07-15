`timescale 1ns / 1ps

module siso_register (
    input wire clk,
    input wire rst,
    input wire serial_in,
    output reg serial_out
);

reg [3:0] shift_reg; // 4-bit shift register

always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <= 4'b0000;
        serial_out <= 1'b0;
    end else begin
        serial_out <= shift_reg[0]; // Output the LSB
        shift_reg <= {serial_in, shift_reg[3:1]}; // Shift right and input new bit
    end
end

endmodule
