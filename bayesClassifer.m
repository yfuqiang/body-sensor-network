function [ labels ] = bayesClassifer(trainData,trainLabel,K,testData)
%trainData ѵ������
%trainLabel ѵ�����ݵı�ǩ
%K ѵ�����ݵ�����
%testData ��������
[~,dimentr]=size(trainData);
[numsts,dimente]=size(testData);
if dimentr~=dimente
    disp('���󣡲������ݺ�ѵ������ά����һ����');
    return;
end
mu=zeros(K,dimentr);%������ľ�ֵ
sigma=zeros(dimentr*K,dimentr);%�������Э����
%���������ľ�ֵ��Э����
for i=1:K
    mu(i,:)=mean(trainData(trainLabel==i,:));
    sigma(((i-1)*dimentr+1):i*dimentr,:)=cov(trainData(trainLabel==i,:));
end
%�Բ������ݶԸ�������бȶ�
labels=zeros(numsts,1);
for i=1:numsts
    P=zeros(1,K);
    for j=1:K
        %������Ժ���
        P(j)=mvnpdf(testData(i,:),mu(j,:),sigma((j-1)*dimentr+1:j*dimentr,:));
    end
    [~,maxIndex]=max(P);
    labels(i)=maxIndex;
end
%���ӻ�
color = {'r.', 'g.', 'm.', 'b.', 'k.', 'y.'}; 
if dimentr==2
    subplot(1,2,1);
    for i=1:K
        plot(trainData(trainLabel==i,1),trainData(trainLabel==i,2),char(color(i)));
        hold on;
    end
    title('ѵ������');
    subplot(1,2,2);
    for i=1:K
        plot(testData(labels==i,1),testData(labels==i,2),char(color(i)));
        hold on;
    end
    title('��������');
elseif dimentr==3
    subplot(1,2,1);
    for i=1:K
        plot(trainData(trainLabel==i,1),trainData(trainLabel==i,2),trainData(trainLabel==i,3),char(color(i)));
        hold on;
    end
    title('ѵ������');
    subplot(1,2,2);
    for i=1:K
        plot(testData(labels==i,1),testData(labels==i,2),trainData(trainLabel==i,3),char(color(i)));
        hold on;
    end
    title('��������');
else
    disp('ά�Ȳ����ϻ�ͼ��׼��1ά�����û������۾Ͳ�����');
end

end


