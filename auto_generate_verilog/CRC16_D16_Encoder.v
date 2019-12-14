module CRC16_D16_Encoder;

  // polynomial: 0x8005
  // data width: 16
  // convention: the first serial bit is D[15]
  // input total data bits, and the initial value of crc bits
  // begin to generate the decoder function
  function [15:0] nextCRC16_D16;

    input [15:0] Data;
    input [15:0] crc;
    reg [15:0] d;
    reg [15:0] c;
    reg [15:0] newcrc;
  begin
    d = Data;
    c = crc;

    newcrc[0] = d[15] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[12] ^ c[13] ^ c[15];
    newcrc[1] = d[14] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[12] ^ c[13] ^ c[14];
    newcrc[2] = d[14] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[14];
    newcrc[3] = d[15] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[15];
    newcrc[4] = d[3] ^ d[2] ^ c[2] ^ c[3];
    newcrc[5] = d[4] ^ d[3] ^ c[3] ^ c[4];
    newcrc[6] = d[5] ^ d[4] ^ c[4] ^ c[5];
    newcrc[7] = d[6] ^ d[5] ^ c[5] ^ c[6];
    newcrc[8] = d[7] ^ d[6] ^ c[6] ^ c[7];
    newcrc[9] = d[8] ^ d[7] ^ c[7] ^ c[8];
    newcrc[10] = d[9] ^ d[8] ^ c[8] ^ c[9];
    newcrc[11] = d[10] ^ d[9] ^ c[9] ^ c[10];
    newcrc[12] = d[11] ^ d[10] ^ c[10] ^ c[11];
    newcrc[13] = d[12] ^ d[11] ^ c[11] ^ c[12];
    newcrc[14] = d[13] ^ d[12] ^ c[12] ^ c[13];
    newcrc[15] = d[15] ^ d[14] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[11] ^ c[12] ^ c[14] ^ c[15];
    nextCRC16_D16 = newcrc;
  end
  endfunction
endmodule
