function crc = module2divide(dividend,poly,crc_init,len_data,len_crc)
    %输入被除数、生成多项式、crc初始值、数据并行度、校验码长度，可得到返回值余数
    poly_factor = bitget(poly,1:len_crc);
    data_in = bitget(dividend,1:len_data);
    %对于crc初始值为0的情况，也可以直接zeros
    crc = bitget(crc_init,1:len_crc);
    for i=len_data:-1:1
        feedback = xor(crc(len_crc),data_in(i));
        for j=len_crc:-1:2
            crc(j) = xor(crc(j-1),(feedback&poly_factor(j)));
        end
        crc(1) = feedback;
    end