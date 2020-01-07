function [e] = hualianjie3(input_matrix)
a=hualianjie(input_matrix);

b=[a,ones(10,1)+1];
c=hualianjie2(input_matrix);

d=[c,ones(10,1)];
e=[b;d]
end

