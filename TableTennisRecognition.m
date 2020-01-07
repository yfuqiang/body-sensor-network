clear all;
clc;

load('TrainFeature.mat');
load('TestFeature.mat');

%------------------------------------------------------------------------------------------------
%--------------------------------------------knn分类---------------------------------------------

% TrainData=TrainFeature(:,1:108)';
% TrainLabel=TrainFeature(:,109)';
% TestData=TestFeature(:,1:108)';
% TestLabel=TestFeature(:,109)';
% predict_label=knn(TestData,TrainData,TrainLabel,1);
% accuracy=length(find(predict_label == TestLabel))/length(TestLabel)*100;

%------------------------------------------------------------------------------------------------
%--------------------------------------------NB分类----------------------------------------------

% TrainData=TrainFeature(:,1:108);
% TrainLabel=TrainFeature(:,109);
% TestData=TestFeature(:,1:108);
% TestLabel=TestFeature(:,109);
% nba = NaiveBayes.fit(TrainData, TrainLabel);
% predict_label=predict(nba,TestData);
% accuracy=length(find(predict_label == TestLabel))/length(TestLabel)*100;

%------------------------------------------------------------------------------------------------
%--------------------------------------------C4.5------------------------------------------------

TrainData=TrainFeature(:,1:108);
TrainLabel=TrainFeature(:,109);
TestData=TestFeature(:,1:108);
TestLabel=TestFeature(:,109);

predict_label = C4_5(TrainData', TrainLabel', TestData', 5, 10);
accuracy=length(find(predict_label' == TestLabel))/length(TestLabel)*100;

size(TrainData)
size(TrainLabel)
size(TestData)
size(TestLabel)

confusionmat(TestLabel,predict_label) %混淆矩阵
confusion_matrix1(TestLabel,predict_label)