function [k] = hualianjiekk(input_matrix)
aa=input_matrix(8000:18000,2:7);
k=floor(huadongchuangnum(aa)/2);
a=cell(2,18);
featureall1=zeros(k,12);
featureall2=zeros(k,12);
featureall=zeros(k,24);
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

