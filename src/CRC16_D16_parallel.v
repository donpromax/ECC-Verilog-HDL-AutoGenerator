
module CRC16_D16(
  input clk,
  input reset,
  input sync,
  input [15:0] Data,
  output [15:0] newcrc
    );
 
  
  
  reg [15:0] d;
   // wire [15:0] newcrc;
  reg [15:0] c;
  reg r_sync;
  always@(posedge clk)
    r_sync<=sync;
  
  always@(posedge clk or posedge reset) begin
    if(reset) begin
      d<=16'd0;
      c<=16'd0;
    end
    else if(sync) begin
      d<=16'd0;
      c<=16'd0;
    end
    else if(r_sync) begin
      d <= Data;
      c <= 16'd0;
    end
    else begin
      d <= Data;
      c <= newcrc;
    end
 
  end
 
  assign newcrc[0] = d[15] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[12] ^ c[13] ^ c[15];
  assign newcrc[1] = d[14] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[12] ^ c[13] ^ c[14];
  assign newcrc[2] = d[14] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[14];
  assign newcrc[3] = d[15] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[15];
  assign newcrc[4] = d[3] ^ d[2] ^ c[2] ^ c[3];
  assign newcrc[5] = d[4] ^ d[3] ^ c[3] ^ c[4];
  assign newcrc[6] = d[5] ^ d[4] ^ c[4] ^ c[5];
  assign newcrc[7] = d[6] ^ d[5] ^ c[5] ^ c[6];
  assign newcrc[8] = d[7] ^ d[6] ^ c[6] ^ c[7];
  assign newcrc[9] = d[8] ^ d[7] ^ c[7] ^ c[8];
  assign newcrc[10] = d[9] ^ d[8] ^ c[8] ^ c[9];
  assign newcrc[11] = d[10] ^ d[9] ^ c[9] ^ c[10];
  assign newcrc[12] = d[11] ^ d[10] ^ c[10] ^ c[11];
  assign newcrc[13] = d[12] ^ d[11] ^ c[11] ^ c[12];
  assign newcrc[14] = d[13] ^ d[12] ^ c[12] ^ c[13];
  assign newcrc[15] = d[15] ^ d[14] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[12] ^ c[14] ^ c[15];
 
 
endmodule