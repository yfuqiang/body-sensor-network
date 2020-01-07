function [featureall] = hualianjie80(input_matrix,input2,input3)
aa=input_matrix(input2:input3,2:7);
k=10;
a=cell(2,18);
featureall1=zeros(k,18);
featureall2=zeros(k,18);
featureall=zeros(k,36);
huadongchuangAcc(aa);
for i=1:1:k
    a{1,i}=ans{1,i}  
end
huadongchuangGry(aa);
for i=1:1:k
    a{2,i}=ans{1,i}  
end
for i=1:1:k
  laji(a{1,i})  
 featureall1(i,:)=ans;    
end
for i=1:1:k
    laji(a{2,i})  
    featureall2(i,:)=ans;    
end
m=featureall1;
n=featureall2;
featureall=[m n]
end


