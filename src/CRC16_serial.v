module CRC16_serial(
  input clk,     /*clock input*/
  input rst,     /*async reset,active low*/
  input sync,
  input data_in, /*parallel data input pins */
  output reg [15:0] newcrc
);
  
  reg [15:0] feedback;
  reg d;
  reg [15:0] c;
  reg r_sync;

/*
*  sequential process
*/

  always@(posedge clk)
  r_sync<=sync;

  always @(posedge clk or posedge rst)
  begin
    if(rst) begin    
      d <= 1'b0; 
      c <= 16'b0; 
    end
    else if(sync) begin
      d <= 1'b0;
      c <= 16'b0;
    end
    else if(r_sync) begin
      d <= data_in;
      c <= 16'b0;
    end         
    else begin
      d <= data_in;
      c <= newcrc;
    end
  end

/*
*   combination process
*/
  always@(*)
  begin
    feedback    = c[15] ^ d;
    newcrc[15]  = c[14] ^ feedback;
    newcrc[14]  = c[13];
    newcrc[13]  = c[12];
    newcrc[12]  = c[11];
    newcrc[11]  = c[10];
    newcrc[10]  = c[9];
    newcrc[9]   = c[8];
    newcrc[8]   = c[7];
    newcrc[7]   = c[6];
    newcrc[6]   = c[5];
    newcrc[5]   = c[4];
    newcrc[4]   = c[3];
    newcrc[3]   = c[2];
    newcrc[2]   = c[1] ^ feedback;
    newcrc[1]   = c[0];
    newcrc[0]   = feedback;
  end

endmodule