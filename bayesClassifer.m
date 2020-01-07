function [ labels ] = bayesClassifer(trainData,trainLabel,K,testData)
%trainData 训练数据
%trainLabel 训练数据的标签
%K 训练数据的类数
%testData 测试数据
[~,dimentr]=size(trainData);
[numsts,dimente]=size(testData);
if dimentr~=dimente
    disp('错误！测试数据和训练数据维数不一样！');
    return;
end
mu=zeros(K,dimentr);%各个类的均值
sigma=zeros(dimentr*K,dimentr);%各个类的协方差
%计算各个类的均值和协方差
for i=1:K
    mu(i,:)=mean(trainData(trainLabel==i,:));
    sigma(((i-1)*dimentr+1):i*dimentr,:)=cov(trainData(trainLabel==i,:));
end
%对测试数据对各个类进行比对
labels=zeros(numsts,1);
for i=1:numsts
    P=zeros(1,K);
    for j=1:K
        %求相关性函数
        P(j)=mvnpdf(testData(i,:),mu(j,:),sigma((j-1)*dimentr+1:j*dimentr,:));
    end
    [~,maxIndex]=max(P);
    labels(i)=maxIndex;
end
%可视化
color = {'r.', 'g.', 'm.', 'b.', 'k.', 'y.'}; 
if dimentr==2
    subplot(1,2,1);
    for i=1:K
        plot(trainData(trainLabel==i,1),trainData(trainLabel==i,2),char(color(i)));
        hold on;
    end
    title('训练数据');
    subplot(1,2,2);
    for i=1:K
        plot(testData(labels==i,1),testData(labels==i,2),char(color(i)));
        hold on;
    end
    title('测试数据');
elseif dimentr==3
    subplot(1,2,1);
    for i=1:K
        plot(trainData(trainLabel==i,1),trainData(trainLabel==i,2),trainData(trainLabel==i,3),char(color(i)));
        hold on;
    end
    title('训练数据');
    subplot(1,2,2);
    for i=1:K
        plot(testData(labels==i,1),testData(labels==i,2),trainData(trainLabel==i,3),char(color(i)));
        hold on;
    end
    title('测试数据');
else
    disp('维度不符合画图标准（1维的懒得画），咱就不画啦');
end

end


