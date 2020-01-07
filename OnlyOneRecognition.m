clear;
clc;
% k�۶���ʶ��
accuracy=zeros(1,270);%ʶ���ʣ���Ҫƽ��

for i = 1:270 %ѭ��3�Σ��ֱ�ȡ����i������Ϊ����������������������Ϊѵ������
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

%% ��һ������
function [data]=normalization(x)
%x=mXn  mΪ��������nΪѵ����������
[m,n]=size(x);
normal=zeros(m,n);
for i=1:n
    mea=mean(x(:,i));
    va=var(x(:,i),1);
    normal(:,i)=(x(:,i)-mea)/sqrt(va);
end
data=normal;
end
