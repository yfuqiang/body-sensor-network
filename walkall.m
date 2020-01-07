function [j] = walkall(inputArg1,inputArg2,inputArg3,inputArg4,inputArg5,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16)

a=walklianjie(inputArg1,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);
b=walklianjie(inputArg2,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);    
c=walklianjie(inputArg3,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);  
d=walklianjie(inputArg4,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);
e=walklianjie(inputArg5,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);
i=[a b c d e]
j=[i,ones(40,1)]


end

