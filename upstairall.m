function [j] = upstairall(inputArg1,inputArg2,inputArg3,inputArg4,inputArg5,inputArg9,inputArg10)

a=hualianjieupstair(inputArg1,inputArg9,inputArg10);
b=hualianjieupstair(inputArg2,inputArg9,inputArg10);    
c=hualianjieupstair(inputArg3,inputArg9,inputArg10);  
d=hualianjieupstair(inputArg4,inputArg9,inputArg10);
e=hualianjieupstair(inputArg5,inputArg9,inputArg10);
i=[a b c d e]
j=[i,ones(60,1)+4]


end



