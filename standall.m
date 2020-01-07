function [j] = standall(inputArg1,inputArg2,inputArg3,inputArg4,inputArg5,inputArg6,inputArg8,inputArg9,inputArg10)

a=hualianjiestand(inputArg1,inputArg9,inputArg10);
b=hualianjiestand(inputArg2,inputArg9,inputArg10);    
c=hualianjiestand(inputArg3,inputArg9,inputArg10);  
d=hualianjiestand(inputArg4,inputArg9,inputArg10);
e=hualianjiestand(inputArg5,inputArg9,inputArg10);
f=hualianjiestand(inputArg6,inputArg9,inputArg10);

h=hualianjiestand(inputArg8,inputArg9,inputArg10);
i=[a b c d e f h]
j=[i,ones(100,1)+2]


end


