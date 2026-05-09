module PIPO(
   input      [3:0]din_i, 
   input           load_i, 
   input           clk_i, 
   input           rst_i, 
   output reg [3:0]dout_o
);

//net(s)
reg [3:0]DATA;
always@(posedge clk_i) begin
   if(rst_i)
      dout_o <= 1'b0;
   else if(load_i) begin
      dout_o <= din_i;
   end
end

endmodule
