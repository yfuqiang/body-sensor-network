function [j] = downstairall(inputArg1,inputArg2,inputArg3,inputArg4,inputArg5,inputArg9,inputArg10)

a=hualianjiedownstair(inputArg1,inputArg9,inputArg10);
b=hualianjiedownstair(inputArg2,inputArg9,inputArg10);    
c=hualianjiedownstair(inputArg3,inputArg9,inputArg10);  
d=hualianjiedownstair(inputArg4,inputArg9,inputArg10);
e=hualianjiedownstair(inputArg5,inputArg9,inputArg10);
i=[a b c d e]
j=[i,ones(60,1)+5]


end





