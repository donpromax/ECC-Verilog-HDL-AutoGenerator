function num = arr2num(array)
    % 将二进制数组里存储的数据转换为数字
    %   输入array为bit数组
    num = 0;
    for i=length(array):-1:1
        num = bitshift(array(i),i-1)+num;
    end
end

