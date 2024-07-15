`timescale 1ns / 1ps
module tb_siso_register;
reg clk;
reg rst;
reg serial_in;
wire serial_out;
siso_register uut (.clk(clk),.rst(rst),.serial_in(serial_in),.serial_out(serial_out));

initial begin
    // Initialize the inputs
    clk = 0;
    rst=1;
    serial_in=0;
    #10 rst=0;
    end
  always #5 clk=~clk;
  always #10 serial_in=~serial_in;
  initial #100 $finish;  
    
initial begin
    // Monitor the outputs
    $monitor("At time %t, rst = %b, serial_in = %b, serial_out = %b", $time, rst, serial_in, serial_out);
end

endmodule

