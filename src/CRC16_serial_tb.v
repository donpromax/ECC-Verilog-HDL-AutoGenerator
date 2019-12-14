module CRC16_serial_tb;
 
    // Inputs
    reg clk;
    reg rst;
    reg sync;
    reg data_in;
 
    // Outputs
    wire [15:0] crc;
 
    // Instantiate the Unit Under Test (UUT)
    CRC16_serial uut (
        .clk(clk), 
        .rst(rst), 
        .sync(sync),
        .data_in(data_in), 
        .newcrc(crc)
    );
 
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    initial begin
        rst=1;
        #20 rst=0;
    end
    initial begin
        sync=1;
        #30 sync=0;
    end
    initial begin
        #30 data_in<=1'b1;
        #10 data_in<=1'b0;
        #10 data_in<=1'b1;
        #10 data_in<=1'b0;

        #10 data_in<=1'b1;
        #10 data_in<=1'b0;
        #10 data_in<=1'b1;
        #10 data_in<=1'b0;

        #10 data_in<=1'b1;
        #10 data_in<=1'b0;
        #10 data_in<=1'b1;
        #10 data_in<=1'b0;

        #10 data_in<=1'b1;
        #10 data_in<=1'b0;
        #10 data_in<=1'b1;
        #10 data_in<=1'b0;
    end
      
endmodule