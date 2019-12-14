function M = getCrcMatrix(poly,len_data,len_crc)
    %GETCRCMATRIX 此处显示有关此函数的摘要
    %   此处显示详细说明
    M = zeros(len_crc,len_crc);
    for i=1:len_crc
        M(:,i) = module2divide(0,poly,bitshift(1,i-1),len_data,len_crc);
    end

