

%% ʵ�����ݵĹ�һ������
function [y,ps] = scale_data(data,ymax,ymin)
ps.dataNum=size(data,2);%��������
ps.dataMax=max(data,[],2);%����ÿ�е����ֵ���Ǹ�������
ps.dataMin=min(data,[],2);%����ÿ�е���Сֵ���Ǹ�������
ps.dataRange = ps.dataMax-ps.dataMin;
ps.scale_dataNum=ps.dataNum;
ps.scale_dataMax=ymax;
ps.scale_dataMin=ymin;
ps.scale_dataRange=ps.scale_dataMax-ps.scale_dataMin;
N =size(data,2);%data�������������ĸ���
onesN=ones(1,N);
rangex = ps.dataMax-ps.dataMin;
rangex(rangex==0) = 1; % Avoid divisions by zero
rangey = ymax-ymin;
y = rangey * (data-ps.dataMin(:,onesN))./rangex(:,onesN) + ymin;


