
% k�۶���ʶ��
accuracy=zeros(1,1);
s1=zeros(10,40)
s2=zeros(10,40)
    ALLData=D;

for i = 1:10 %ѭ��3�Σ��ֱ�ȡ����i������Ϊ����������������������Ϊѵ������
    gettest = crossvalind('Kfold', 400, 10);%��������������ָ�Ϊ10����.gettestΪ��������

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
% trainset=trainData; %��ȡѵ����
% testset=testData;%��ȡ���Լ�
% [testm,~]=size(testset);
% [trainm,trainn]=size(trainset);
% 
% nbayeslabel=zeros(testm,1); %���ر�Ҷ˹�Ĳ��Ա�ǩ
% c=[]; %�����洢����ǩ
% c=[c;trainset(1,end)]; %�洢ѵ������һ�����ݵ�����ǩ
% 
% for i=1:trainm
%     if ismember(trainset(i,end),c)==0
%         c=[c;trainset(i,end)];     %���µ�����ǩ����c
%     end
% end
% pc=c;  %�������
% for i=1:size(c,1)
%     pc(i)=size(trainset(trainset(:,end)==c(i),end),1)/trainm; %����c�������
% end
% u=zeros(trainn-1,size(c,1));%ÿ�����Ե���ѵ����ÿ�����ľ�ֵ�ͷ���
% dx=zeros(trainn-1,size(c,1));
% for i=1:size(c,1)
%     u(:,i)=(mean(trainset(trainset(:,end)==c(i),1:trainn-1)))';%ÿ�����Ե���ѵ����ÿ�����ľ�ֵ�ͷ���
%     dx(:,i)=(var(trainset(trainset(:,end)==c(i),1:trainn-1)))';
% end
% for i=1:testm
%     px=zeros(trainn-1,size(c,1));%ÿ�����Ե�����������
%     pcx=zeros(size(c,1),1);%ÿ����x�ĺ������
%     for j=1:trainn-1
%         for k=1:size(c,1)
%             
%             px(j,k)=(1/(sqrt(2*pi)*sqrt(dx(j,k))))*exp(-(testset(i,j)-u(j,k))^2/(2*dx(j,k)));%ÿ�����Ե�����������
%         end
%     end
%     for k=1:size(c,1)
%         pcx(k)=pc(k)*prod(px(:,k));%ÿ����x�ĺ������
%     end
%     [~,m]=max(pcx);
%     nbayeslabel(i)=c(m);%ѡ����������ʵ���ΪԤ���ǩ
% end
% acc=0;%����
% for i=1:testm
%     if nbayeslabel(i)==testset(i,end)
%         acc=acc+1;
%     end
% end
% [predict_label]=nbayeslabel;
% acc=acc/testm;%���վ���
%  accuracy(pp)=acc;
%********************************BP**********************************************
    TrainData=trainData(:,1:180)';
    TrainLabel=trainData(:,181)';
    TestData=testData(:,1:180)';
    TestLabel=testData(:,181)';%�õ�ѵ�������Լ����������ǩ
    
    [TrainDatan,TrainDataps]=mapminmax(TrainData);
    [TrainLabeln,TrainLabelps]=mapminmax(TrainLabel);%��һ��

    net=newff(TrainDatan,TrainLabeln,5);%����������Ԫ��
    net.trainParam.epochs=100;%����������
    net.trainParam.lr=0.1;%ѧϰ��
    net.trainParam.goal=0.00004;%ѵ����Ŀ�����
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