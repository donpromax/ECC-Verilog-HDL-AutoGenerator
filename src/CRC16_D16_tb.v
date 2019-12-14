
module CRC16_D16_tb;
 
    // Inputs
    reg clk;
    reg reset;
    reg sync;
    reg [15:0] Data;
 
    // Outputs
    wire [15:0] c;
 
    // Instantiate the Unit Under Test (UUT)
    CRC16_D16 uut (
        .clk(clk), 
        .reset(reset), 
        .sync(sync), 
        .Data(Data), 
        .newcrc(c)
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
        #50 Data<=16'haaaa;
 
    end
      
endmodule