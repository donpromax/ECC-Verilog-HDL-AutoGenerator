function Map = errorBitMap(poly,len_data,len_crc,type)
    %输入生成多项式、数据长度、校验位长度-可得到纠错电路的ERROR_BIT映射表
    %   poly:生成多项式
    %	len_data:数据位宽
    %	len_crc:校验位宽
    %
    %   映射表将存放在Map字符串向量中,注意crc码能够纠错的条件为
    %               len_data+len_crc < 2^len_crc
    
    Map = cell(5,1);
    if len_data+len_crc < 2^len_crc
        for i = 1:len_crc
            residue = module2divide(bitshift(1,i-1),poly,0,...
                len_data+len_crc,len_crc);
            if i>10
                message = ['crc[',num2str(i-1),']: '];
            else
                message = ['crc[',num2str(i-1),'] : '];
            end
            if type == 'h'
                Map(i)=cellstr(arr2hex(residue,ceil(len_crc/4)));
                message1=[message,arr2hex(residue,ceil(len_crc/4))];
            elseif type == 'b'
                Map(i)=cellstr(arr2bin(residue,len_crc));
                message1=[message,arr2bin(residue,len_crc)];
            end
            disp(message1);
        end
        for i = len_crc+1:len_crc+len_data
            residue = module2divide(bitshift(1,i-1),poly,0,...
                len_data+len_crc,len_crc);
            if i-len_crc > 10
                message = ['data[',num2str(i-1-len_crc),']:'];
            else
                message = ['data[',num2str(i-1-len_crc),']: '];
            end
            if type == 'h'
                Map(i)=cellstr(arr2hex(residue,ceil(len_crc/4)));
                message1=[message,arr2hex(residue,ceil(len_crc/4))];
            elseif type == 'b'
                Map(i)=cellstr(arr2bin(residue,len_crc));
                message1=[message,arr2bin(residue,len_crc)];
            end
            disp(message1);
        end
    else
        fprintf(['设计的ecc电路无纠错能力，请检查后重新提交！','\n',...
            '需要满足条件：len_data+len_crc < 2^len_crc\n']);
    end
    
