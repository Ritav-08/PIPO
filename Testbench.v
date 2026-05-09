module tb_PIPO();
reg load_ti;
reg clk_ti = 1'b0;
reg [3:0]din_ti;
reg rst_ti;
wire [3:0]dout_to;

//instantiation
PIPO DUT(.din_i(din_ti), 
   .load_i(load_ti), 
   .clk_i(clk_ti), 
   .rst_i(rst_ti), 
   .dout_o(dout_to));

//clock
initial begin
   forever
      #5 clk_ti = ~clk_ti;
end

//feeding
initial begin
rst_ti = 1'b1;
load_ti = 1'b0;
din_ti = 4'b0000;
#10 rst_ti = 1'b0;
    load_ti = 1'b1;
    din_ti = 4'b1010;
#10 load_ti = 1'b0;
    din_ti = 4'b1111;
#20 load_ti = 1'b1;
#10 load_ti = 1'b0;
#10 $finish;
end

//capture
initial begin
$monitor("Time: %0t | Load: %b, Clk: %b | Input: %h | Output: %h", $time, load_ti, clk_ti, din_ti, dout_to);
$dumpfile("PIPO.vcd");
$dumpvars(0, tb_PIPO);
end
endmodule