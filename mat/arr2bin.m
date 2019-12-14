function bin = arr2bin(array,n)
    % 将二进制数组里存储的数据以二进制字符串的形式显示的函数
    %   输入arr为bit数组
    bin = 0;
    for i=length(array):-1:1
        bin = bitshift(array(i),i-1)+bin;
    end
    bin = dec2bin(bin,n);
