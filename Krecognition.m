
% k折动作识别
accuracy=zeros(1,1);
s1=zeros(10,40)
s2=zeros(10,40)
    ALLData=D;

for i = 1:10 %循环3次，分别取出第i部分作为测试样本，其余两部分作为训练样本
    gettest = crossvalind('Kfold', 400, 10);%将数据样本随机分割为10部分.gettest为索引矩阵

    test = (gettest == i);
    train1 = ~test;
    trainData = ALLData(train1, :);
    testData = ALLData(test, :);
    
%****************************Naive bayes********************************
%  
%    TrainData=trainData(:,1:180);
%    TrainLabel=trainData(:,181);
%    TestData=testData(:,1:180);
%    TestLabel=testData(:,181);
%    nba = fitcnb(TrainData, TrainLabel);
%    predict_label=predict(nba,TestData);
%    accuracy(i)=length(find(predict_label == TestLabel))/length(TestLabel)*100;
%    s1(i,:)=predict_label';
%    s2(i,:)=TestLabel';
    
%****************************KNN*****************************************  
%     TrainData=trainData(:,1:180)';
%     TrainLabel=trainData(:,181)';
%     TestData=testData(:,1:180)';
%     TestLabel=testData(:,181)';
%     TrainData2=[];
%     TestData2=[];
%     [TrainData2,ps1]=normalization(TrainData,1,0);
%     [TestData2,ps2]=normalization(TestData,1,0);
%     predict_label=knn(TestData,TrainData,TrainLabel,3);
%     accuracy(i)=length(find(predict_label == TestLabel))/length(TestLabel)*100;
%     s1(i,:)=predict_label';
%     s2(i,:)=TestLabel';
  
%****************************C4.5****************************************
% 
%   TrainData=trainData(:,1:216);
%   TrainLabel=trainData(:,217);
%   TestData=testData(:,1:216);
%   TestLabel=testData(:,217);
%   predict_label = C4_5(TrainData', TrainLabel', TestData', 15, 10);
%   accuracy(i)=length(find(predict_label' == TestLabel))/length(TestLabel)*100;
%   s1(i,:)=predict_label;
%   s2(i,:)=TestLabel';
%    
%****************************SVM******************************************   

%   TrainData=trainData(:,1:180);
%   TrainLabel=trainData(:,181);
%   TestData=testData(:,1:180);
%   TestLabel=testData(:,181);
%   TrainData2=[];
%   TestData2=[];
%   [TrainData2,ps1]=normalization(TrainData,1,0);
%   [TestData2,ps2]=normalization(TestData,1,0);
%   model = svmtrain(TrainLabel,TrainData,'-s 0 -t 1 -c 2 -g 1.8');
%   [predict_label]=svmpredict(TestLabel,TestData,model);
%   accuracy(i)=length(find(predict_label == TestLabel))/length(TestLabel)*100;
%   s1(i,:)=predict_label';
%   s2(i,:)=TestLabel';
   %********************************Bayes**********************************************
 
% TestLabel=testData(:,181);
% pp=i;
% trainset=trainData; %获取训练集
% testset=testData;%获取测试集
% [testm,~]=size(testset);
% [trainm,trainn]=size(trainset);
% 
% nbayeslabel=zeros(testm,1); %朴素贝叶斯的测试标签
% c=[]; %用来存储类别标签
% c=[c;trainset(1,end)]; %存储训练集第一个数据的类别标签
% 
% for i=1:trainm
%     if ismember(trainset(i,end),c)==0
%         c=[c;trainset(i,end)];     %将新的类别标签放入c
%     end
% end
% pc=c;  %先验概率
% for i=1:size(c,1)
%     pc(i)=size(trainset(trainset(:,end)==c(i),end),1)/trainm; %计算c先验概率
% end
% u=zeros(trainn-1,size(c,1));%每个属性的在训练集每个类别的均值和方差
% dx=zeros(trainn-1,size(c,1));
% for i=1:size(c,1)
%     u(:,i)=(mean(trainset(trainset(:,end)==c(i),1:trainn-1)))';%每个属性的在训练集每个类别的均值和方差
%     dx(:,i)=(var(trainset(trainset(:,end)==c(i),1:trainn-1)))';
% end
% for i=1:testm
%     px=zeros(trainn-1,size(c,1));%每个属性的类条件概率
%     pcx=zeros(size(c,1),1);%每个点x的后验概率
%     for j=1:trainn-1
%         for k=1:size(c,1)
%             
%             px(j,k)=(1/(sqrt(2*pi)*sqrt(dx(j,k))))*exp(-(testset(i,j)-u(j,k))^2/(2*dx(j,k)));%每个属性的类条件概率
%         end
%     end
%     for k=1:size(c,1)
%         pcx(k)=pc(k)*prod(px(:,k));%每个点x的后验概率
%     end
%     [~,m]=max(pcx);
%     nbayeslabel(i)=c(m);%选择最大后验概率的作为预测标签
% end
% acc=0;%精度
% for i=1:testm
%     if nbayeslabel(i)==testset(i,end)
%         acc=acc+1;
%     end
% end
% [predict_label]=nbayeslabel;
% acc=acc/testm;%最终精度
%  accuracy(pp)=acc;
%********************************BP**********************************************
    TrainData=trainData(:,1:180)';
    TrainLabel=trainData(:,181)';
    TestData=testData(:,1:180)';
    TestLabel=testData(:,181)';%得到训练集测试集的数据与标签
    
    [TrainDatan,TrainDataps]=mapminmax(TrainData);
    [TrainLabeln,TrainLabelps]=mapminmax(TrainLabel);%归一化

    net=newff(TrainDatan,TrainLabeln,5);%设置隐层神经元数
    net.trainParam.epochs=100;%最大迭代次数
    net.trainParam.lr=0.1;%学习率
    net.trainParam.goal=0.00004;%训练的目标误差
    net=train(net,TrainDatan,TrainLabeln);
    TestDatan=mapminmax('apply',TestData,TrainDataps);
    an=sim(net,TestDatan);
    BPoutput=mapminmax('reverse',an,TrainLabelps);
    aaaa=round(BPoutput);
    accuracy(i)=length(find(aaaa == TestLabel))/length(TestLabel)*100;
   s1(i,:)=aaaa;
   s2(i,:)=TestLabel';
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


%% 实现数据的归一化处理
function [y,newdata] = normalization(data,ymax,ymin)
newdata.dataNum=size(data,2);%样本个数
newdata.dataMax=max(data,[],2);%矩阵每行的最大值，是个列向量
newdata.dataMin=min(data,[],2);%矩阵每行的最小值，是个列向量

N =size(data,2);%data的列数，样本的个数
onesN=ones(1,N);
rangex = newdata.dataMax-newdata.dataMin;
rangex(rangex==0) = 1; % Avoid divisions by zero
rangey = ymax-ymin;
y = rangey * (data-newdata.dataMin(:,onesN))./rangex(:,onesN) + ymin;
end