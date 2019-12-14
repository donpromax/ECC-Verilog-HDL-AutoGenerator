
module CRC16_decoder(
  input clk,
  input reset,
  input sync,
  input [31:0] Data,
  output reg [31:0] correct_code
    );
 
  reg [31:0] d;
  reg [15:0] c;
  reg r_sync;
  wire [15:0] newcrc;

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
  
 
    assign newcrc[0] = d[31] ^ d[30] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^ d[19] ^ d[18] ^ d[17] ^ d[16] ^ d[15] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[14] ^ c[15];
    assign newcrc[1] = d[31] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^ d[19] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[12] ^ c[15];
    assign newcrc[2] = d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[16] ^ d[14] ^ d[1] ^ d[0] ^ c[0] ^ c[12] ^ c[13] ^ c[14] ^ c[15];
    assign newcrc[3] = d[31] ^ d[30] ^ d[29] ^ d[17] ^ d[15] ^ d[2] ^ d[1] ^ c[1] ^ c[13] ^ c[14] ^ c[15];
    assign newcrc[4] = d[31] ^ d[30] ^ d[18] ^ d[16] ^ d[3] ^ d[2] ^ c[0] ^ c[2] ^ c[14] ^ c[15];
    assign newcrc[5] = d[31] ^ d[19] ^ d[17] ^ d[4] ^ d[3] ^ c[1] ^ c[3] ^ c[15];
    assign newcrc[6] = d[20] ^ d[18] ^ d[5] ^ d[4] ^ c[2] ^ c[4];
    assign newcrc[7] = d[21] ^ d[19] ^ d[6] ^ d[5] ^ c[3] ^ c[5];
    assign newcrc[8] = d[22] ^ d[20] ^ d[7] ^ d[6] ^ c[4] ^ c[6];
    assign newcrc[9] = d[23] ^ d[21] ^ d[8] ^ d[7] ^ c[5] ^ c[7];
    assign newcrc[10] = d[24] ^ d[22] ^ d[9] ^ d[8] ^ c[6] ^ c[8];
    assign newcrc[11] = d[25] ^ d[23] ^ d[10] ^ d[9] ^ c[7] ^ c[9];
    assign newcrc[12] = d[26] ^ d[24] ^ d[11] ^ d[10] ^ c[8] ^ c[10];
    assign newcrc[13] = d[27] ^ d[25] ^ d[12] ^ d[11] ^ c[9] ^ c[11];
    assign newcrc[14] = d[28] ^ d[26] ^ d[13] ^ d[12] ^ c[10] ^ c[12];
    assign newcrc[15] = d[31] ^ d[30] ^ d[29] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^ d[19] ^ d[18] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[13] ^ c[14] ^ c[15];
    
    
  always @(*) begin
    correct_code = d;
    case(newcrc)
    16'h8005:correct_code[0] = !d[0];
    16'h800F:correct_code[1] = !d[1];
    16'h801B:correct_code[2] = !d[2];
    16'h8033:correct_code[3] = !d[3];
    16'h8063:correct_code[4] = !d[4];
    16'h80C3:correct_code[5] = !d[5];
    16'h8183:correct_code[6] = !d[6];
    16'h8303:correct_code[7] = !d[7];
    16'h8603:correct_code[8] = !d[8];
    16'h8C03:correct_code[9] = !d[9];
    16'h9803:correct_code[10] = !d[10];
    16'hB003:correct_code[11] = !d[11];
    16'hE003:correct_code[12] = !d[12];
    16'h4003:correct_code[13] = !d[13];
    16'h8006:correct_code[14] = !d[14];
    16'h8009:correct_code[15] = !d[15];
    16'h8017:correct_code[16] = !d[16];
    16'h802B:correct_code[17] = !d[17];
    16'h8053:correct_code[18] = !d[18];
    16'h80A3:correct_code[19] = !d[19];
    16'h8143:correct_code[20] = !d[20];
    16'h8283:correct_code[21] = !d[21];
    16'h8503:correct_code[22] = !d[22];
    16'h8A03:correct_code[23] = !d[23];
    16'h9403:correct_code[24] = !d[24];
    16'hA803:correct_code[25] = !d[25];
    16'hD003:correct_code[26] = !d[26];
    16'h2003:correct_code[27] = !d[27];
    16'h4006:correct_code[28] = !d[28];
    16'h800C:correct_code[29] = !d[29];
    16'h801D:correct_code[30] = !d[30];
    16'h803F:correct_code[31] = !d[31];
    endcase
  end
endmodule