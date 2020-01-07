function [j] = runall(inputArg1,inputArg2,inputArg3,inputArg4,inputArg5,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16)

a=walklianjierun(inputArg1,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);
b=walklianjierun(inputArg2,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);    
c=walklianjierun(inputArg3,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);  
d=walklianjierun(inputArg4,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);
e=walklianjierun(inputArg5,inputArg9,inputArg10,inputArg11,inputArg12,inputArg13,inputArg14,inputArg15,inputArg16);
i=[a b c d e]
j=[i,ones(40,1)+3]


end


