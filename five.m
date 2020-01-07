
% k�۶���ʶ��
accuracy=zeros(1,1);
s1=zeros(10,88)
s2=zeros(10,88)
ALLData=D;
gettest = crossvalind('Kfold', 880, 10);%��������������ָ�Ϊ10����.gettestΪ��������
for i = 1:1 %ѭ��3�Σ��ֱ�ȡ����i������Ϊ����������������������Ϊѵ������
    
    
 
    test = (gettest == i);
    train = ~test;
    trainData = ALLData(train, :);
    testData = ALLData(test, :);
    
%****************************Naive bayes********************************
% 
%    TrainData=trainData(:,1:168);
%    TrainLabel=trainData(:,169);
%    TestData=testData(:,1:168);
%    TestLabel=testData(:,169);
%    nba = fitcnb(TrainData, TrainLabel);
%    predict_label=predict(nba,TestData);
%    accuracy(i)=length(find(predict_label == TestLabel))/length(TestLabel)*100;
  
%****************************C4.5****************************************

  TrainData=trainData(:,1:168);
  TrainLabel=trainData(:,169);
  TestData=testData(:,1:168);
  TestLabel=testData(:,169);
  predict_label = C4_5(TrainData', TrainLabel', TestData', 5, 10);
  accuracy(i)=length(find(predict_label' == TestLabel))/length(TestLabel)*100;
  s1(i,:)=predict_label
  s2(i,:)=TestLabel'
   
%****************************SVM******************************************   
% 
%   TrainData=trainData(:,1:252);
%   TrainLabel=trainData(:,253);
%   TestData=testData(:,1:252);
%   TestLabel=testData(:,253);
%   TrainData2=[];
%   TestData2=[];
% 
%   model = svmtrain(TrainLabel,TrainData,'-s 0 -t 1 -c 2 -g 1.8');
%   [predict_label]=svmpredict(TestLabel,TestData,model);
%   accuracy(i)=length(find(predict_label == TestLabel))/length(TestLabel)*100;
%   s1(i,:)=predict_label;
%   s2(i,:)=TestLabel';
end

mean(accuracy)

a11=s1(1,:);
a12=s1(2,:);
a13=s1(3,:);
a14=s1(4,:);
a15=s1(5,:);
a16=s1(6,:);
a17=s1(7,:);
a18=s1(8,:);
a19=s1(9,:);
a110=s1(10,:);
DD=[a11,a12,a13,a14,a15,a16,a17,a18,a19,a110];
b11=s2(1,:);
b12=s2(2,:);
b13=s2(3,:);
b14=s2(4,:);
b15=s2(5,:);
b16=s2(6,:);
b17=s2(7,:);
b18=s2(8,:);
b19=s2(9,:);
b110=s2(10,:);
HH=[b11,b12,b13,b14,b15,b16,b17,b18,b19,b110];


%% ʵ�����ݵĹ�һ������
function [y,newdata] = normalization(data,ymax,ymin)
newdata.dataNum=size(data,2);%��������
newdata.dataMax=max(data,[],2);%����ÿ�е����ֵ���Ǹ�������
newdata.dataMin=min(data,[],2);%����ÿ�е���Сֵ���Ǹ�������

N =size(data,2);%data�������������ĸ���
onesN=ones(1,N);
rangex = newdata.dataMax-newdata.dataMin;
rangex(rangex==0) = 1; % Avoid divisions by zero
rangey = ymax-ymin;
y = rangey * (data-newdata.dataMin(:,onesN))./rangex(:,onesN) + ymin;
end