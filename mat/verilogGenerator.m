function verilogGenerator(poly,len_data,len_crc)
    %VERILOGGENERATOR 此处显示有关此函数的摘要
    %   此处显示详细说明
    Crc = getCrcMatrix(poly,len_data,len_crc);
    Data = getDataMatrix(poly,len_data,len_crc);
    filename = ['CRC',num2str(len_crc),'_D',num2str(len_data),'_Encoder'];
    functionname = ['CRC',num2str(len_crc),'_D',num2str(len_data)];
    filepath = ['../auto_generate_verilog/',filename];
    fileID = fopen([filepath,'.v'],'w');
    if fileID
        fprintf(fileID,['module ',filename,';\n\n']);
        fprintf(fileID,'  // polynomial: 0x%s\n',dec2hex(poly));
        fprintf(fileID,'  // data width: %d\n',len_data);
        fprintf(fileID,'  // convention: the first serial bit is D[%d]\n',len_data-1);
        fprintf(fileID,'  // input total data bits, and the initial value of crc bits\n');
        fprintf(fileID,'  // begin to generate the decoder function\n');
        
        fprintf(fileID,'  function [%d:0] next%s;\n\n',len_crc-1,functionname);
        fprintf(fileID,'    input [%d:0] Data;\n',len_data-1);
        fprintf(fileID,'    input [%d:0] crc;\n',len_crc-1);
        fprintf(fileID,'    reg [%d:0] d;\n',len_data-1);
        fprintf(fileID,'    reg [%d:0] c;\n',len_crc-1);
        fprintf(fileID,'    reg [%d:0] newcrc;\n  begin\n    d = Data;\n    c = crc;\n\n',len_crc-1);
        for i = 1:len_crc
            fprintf(fileID,'    newcrc[%d] = ',i-1);
            for j = len_data:-1:1
                if Data(i,j)
                    fprintf(fileID,'d[%d] ^ ',j-1);
                end
            end
            notfirst = 0;
            for k = 1:len_crc
                if Crc(i,k)
                    if notfirst
                        fprintf(fileID,' ^ ');
                    end
                    notfirst = 1;
                    fprintf(fileID,'c[%d]',k-1);
                end
            end
            fprintf(fileID,';\n');
        end
        fprintf(fileID,'    next%s = newcrc;\n  end\n  endfunction\nendmodule\n',functionname);
        fprintf('成功创建文件%s.v\n',filepath);
    else
        dsp('写入失败!');
    end
    
