function [j] = walkall80(inputArg1,inputArg2,inputArg3,inputArg4,inputArg5,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16)

a=walklianjie80(inputArg1,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);
b=walklianjie80(inputArg2,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);    
c=walklianjie80(inputArg3,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);  
d=walklianjie80(inputArg4,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);
e=walklianjie80(inputArg5,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);
i=[a b c d e]
j=[i,ones(40,1)+1]


end

