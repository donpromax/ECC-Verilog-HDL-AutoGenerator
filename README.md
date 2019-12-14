# ECC Circuit(Verilog HDL Code) Auto-generator
<br>
a cyclic redundancy check(CRC, one kind of Error Correcting Code) software and hardware implementation. Hardware description language can be automatically generated for any specified CRC generator polynomial.
<br>
一个循环校验码（一种ecc错误校验码）的软件和硬件实现
<br>

## Software Implementations
<br> 
For the powerful matrix computing abilities, and gui features, I choose MATLAB for the software and algorithms implementation platform. The functions can be summarized as follows:

* Calculating the data matrix and crc matrix used in the encoding circuits. Generating polynomial(in hex form), data width, and crc width are required as inputs. 
* Calculating the error-location map used in the decoder-corrector circuits. Inputs requirements are the same.
* Automatically generating the verilog HDL codes for encoder and decoder function modules.

For more details, please check the source codes in mat/generatorGUI.m 
<br> 
<br> 
由于MATLAB的高效矩阵运算性能，算法部分由MATLAB实现。mat文件夹下，generatorGUI.m ，目前已经实现的功能和算法：

* 求解任意生成多项式、数据校验位宽的循环校验码编码算法。包括计算Data矩阵，Crc矩阵，给定信息位求校验位3个功能；
* 求解任意生成多项式、数据校验位宽的循环校验码解码算法。可一键生成Error-Bits映射关系表；
* 输入生成多项式、（parallel data bits）并行度和校验位宽，一键生成对应的verilog HDL组合逻辑功能模块;

<br> 

## Hardware Implementations
<br> <br> 
The testbench results have shown that our hardware modules have correct logic function.
<br>

### The encoder module
<div align=center><img width="1000" src="https://github.com/donlv1997/ECC_CRC/raw/master/img/CRC16_serial_input0xaaaa.png"/></div>

Let's take CRC_16_serial for example（x^16+x^15+x^2+1）, as we can clearly see, the serial encoder circuits can generate the correct crc code in 16 clock cycles （input 0xaaaa, output should be fff6). 


While for parallel implementation approach, this process can be done in one cycle:

<br> 
<img align=center src="https://github.com/donlv1997/ECC_CRC/raw/master/img/CRC16_D16_input0xaaaa.png" width="1000"/>
</div>

### The decoder and corrector

Take input data 0xffff for example, the crc code should be 800d. The input data and crc code should be combined to form a dataword 0xffff800d, and together taken as input to the decoder&corrector circuits(parallel implementation). Assuming that a one-bit error occurred during storage or transmission process, in which case the dataword could be 0xfffe800d as the decoder&corrector input. The results 0xffff800d demonstrates that this CRC16_Decoder module can handle 1 bit error.


<div align=center>
	<img src="https://github.com/donlv1997/ECC_CRC/raw/master/img/CRC16_D16_docoder%26corrector.png" width="300"> 
</div>

Generally speaking, the decoder can discover any multiple bits error(the discovery rate can exceed 99%) while can only correct 1 bit error.

## How to use
<div align=center><img width="1000" src="https://github.com/donlv1997/ECC-Verilog-HDL-AutoGenerator/raw/master/img/%E7%AE%97%E6%B3%95%E5%8A%9F%E8%83%BD%E6%A6%82%E8%A7%88%E5%9B%BE.png"/></div>

As shown in the figure above, click the menu '自动生成硬件代码'. Then click '生成编码模块' for encoder auto-generation, click '生成解码模块' for decoder&corrector auto-generation.


Notice that there are 3 input box below, they represents generation polynomial(in hex/bin/dec form), input data width, crc width respectively, please make sure they are modifed according to your needs.
