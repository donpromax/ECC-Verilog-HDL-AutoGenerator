
module CRC16_decoder_tb;
 
    // Inputs
    reg clk;
    reg reset;
    reg sync;
    reg [31:0] Data;
 
    // Outputs
    wire [31:0] c;
 
    // Instantiate the Unit Under Test (UUT)
    CRC16_decoder uut (
        .clk(clk), 
        .reset(reset), 
        .sync(sync), 
        .Data(Data), 
        .correct_code(c)
    );
 
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    initial begin
        reset=1;
        #30 reset=0;
    end
    initial begin
        sync=1;
        #50 sync=0;
    end
    initial begin
        #50 Data<=32'hFFFE800D;
    end
      
endmodule