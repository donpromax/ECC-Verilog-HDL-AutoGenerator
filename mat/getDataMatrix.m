function M = getDataMatrix(poly,len_data,len_crc)
    %GETDATAMATRIX 此处显示有关此函数的摘要
    %   此处显示详细说明
    M = zeros(len_crc,len_data);
    for i=1:len_data
        M(:,i) = module2divide(bitshift(1,i-1),poly,0,len_data,len_crc);
    end

