function hex = arr2hex(array,n)
    % 将二进制数组里存储的数据以十六进制字符串显示的函数
    %   输入arr为bit数组
    hex = 0;
    for i=length(array):-1:1
        hex = bitshift(array(i),i-1)+hex;
    end
    hex = dec2hex(hex,n);