clear;
clc;
% k折动作识别
accuracy=zeros(1,270);%识别率，需要平均

for i = 1:270 %循环3次，分别取出第i部分作为测试样本，其余两部分作为训练样本
    Data=importdata('TotalFeature.mat');
    preData=normalization(Data(:,1:108));
    preLabel=Data(:,109);
    Data=[preData,preLabel];
    
    trainData=Data;
    trainData(i,:)=[];
    testData=Data(i,:);
    
    TrainData=trainData(:,1:108)';
    TrainLabel=trainData(:,109)';
    TestData=testData(:,1:108)';
    TestLabel=testData(:,109)';
    predict_label=knn(TestData,TrainData,TrainLabel,3);
    accuracy(i)=length(find(predict_label == TestLabel))/length(TestLabel)*100;

%     TrainData=trainData(:,1:108);
%     TrainLabel=trainData(:,109);
%     TestData=testData(:,1:108);
%     TestLabel=testData(:,109);
%     nba = fitcnb(TrainData, TrainLabel);
%     predict_label=predict(nba,TestData);
%     accuracy(i)=length(find(predict_label == TestLabel))/length(TestLabel)*100;
    
%     TrainData=trainData(:,1:108);
%     TrainLabel=trainData(:,109);
%     TestData=testData(:,1:108);
%     TestLabel=testData(:,109);
%     predict_label = C4_5(TrainData', TrainLabel', TestData', 5, 10);
%     accuracy(i)=length(find(predict_label' == TestLabel))/length(TestLabel)*100;
end

mean(accuracy)

%% 归一化程序
function [data]=normalization(x)
%x=mXn  m为样本数，n为训练特征个数
[m,n]=size(x);
normal=zeros(m,n);
for i=1:n
    mea=mean(x(:,i));
    va=var(x(:,i),1);
    normal(:,i)=(x(:,i)-mea)/sqrt(va);
end
data=normal;
end
