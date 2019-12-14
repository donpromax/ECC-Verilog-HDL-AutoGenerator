function decodeVerilogGenerator(poly,len_data,len_crc)
    %DECODEVERILOGGENERATOR 此处显示有关此函数的摘要
    %   此处显示详细说明
    len_total = len_data + len_crc;
    Crc = getCrcMatrix(poly,len_total,len_crc);
    Data = getDataMatrix(poly,len_total,len_crc);
    Map = errorBitMap(poly,len_data,len_crc,'h');
    filename = ['CRC',num2str(len_crc),'_D',num2str(len_data),'_Corrector'];
    function1name = ['CRC',num2str(len_crc),'_M',num2str(len_total),'_Decoder'];
    function2name = ['CRC',num2str(len_crc),'_M',num2str(len_total),'_Corrector'];
    filepath = ['../auto_generate_verilog/',filename];
    fileID = fopen([filepath,'.v'],'w');
    %generate the decoder function
    if fileID
        fprintf(fileID,['module ',filename,';\n\n']);
        fprintf(fileID,'  // polynomial: 0x%s\n',dec2hex(poly));
        fprintf(fileID,'  // data width: %d  ;  crc width: %d  ;  total message width = %d\n',len_data,len_crc,len_total);
        fprintf(fileID,'  // input total message bits, and the initial value of crc bits\n');
        fprintf(fileID,'  // begin to generate the decoder function\n');
        
        fprintf(fileID,'  function [%d:0] %s;\n\n',len_crc-1,function1name);
        fprintf(fileID,'    input [%d:0] Data;\n',len_total-1);
        fprintf(fileID,'    input [%d:0] crc;\n',len_crc-1);
        fprintf(fileID,'    reg [%d:0] d;\n',len_total-1);
        fprintf(fileID,'    reg [%d:0] c;\n',len_crc-1);
        fprintf(fileID,'    reg [%d:0] residue;\n  begin\n    d = Data;\n    c = crc;\n\n',len_crc-1);
        for i = 1:len_crc
            fprintf(fileID,'    residue[%d] = ',i-1);
            for j = len_total:-1:1
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
        fprintf(fileID,'    %s = residue;\n  end\n  endfunction\n',function1name);
        
        %generate the corrector function
        fprintf(fileID,'\n\n  // input total message bits, and the residue bits to auto-correct\n');
        fprintf(fileID,'  // begin to generate the corrector function\n');
        fprintf(fileID,'  function [%d:0] %s;\n\n',len_total-1,function2name);
        fprintf(fileID,'    input [%d:0] d;\n',len_total-1);
        fprintf(fileID,'    input [%d:0] residue;\n',len_crc-1);
        fprintf(fileID,'    reg [%d:0] correct_code;\n\n',len_total-1);
        fprintf(fileID,'    begin\n    correct_code = d;\n    case(residue)\n');
        for i = 1:len_total
            fprintf(fileID,'      %d''h%s:correct_code[%d] = !d[%d];\n',len_crc,...
                cell2mat(Map(i)),i-1,i-1);
        end
        fprintf(fileID,'    endcase\n    %s = correct_code;\n    end\n  endfunction\nendmodule',function2name);
        fprintf('成功创建文件%s.v\n',filepath);
    else
        dsp('写入失败!');
    end
    
