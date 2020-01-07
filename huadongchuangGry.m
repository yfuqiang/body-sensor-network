function [bGryData] = huadongchuangGry(input_matrix)
aAccData=input_matrix(:,[1 2 3]);%ȡ1~3��
aGryData=input_matrix(:,[4 5 6]);%ȡ4~6��
windowsize=500; %���û������ڴ�С
windowsNum=floor(length(input_matrix)/windowsize);%����������
thresold=mean(abs(aGryData(:,1)))*2;  %�趨��ֵ
bAccData=cell(1,10);
bGryData=cell(1,10);
count=1; %��ֵ����
for m=1:(windowsNum-1)
    ifvalue = any(findpeaks(abs(aGryData((m-1)*windowsize+1:m*windowsize+1,1))) > thresold);
    if ifvalue
        [pks,locs] = findpeaks(abs(aGryData((m-1)*windowsize+1:m*windowsize+1,1)));
        [Y,Ip]=max(pks);
        locs=locs(Ip)+(m-1)*windowsize;%�õ����ֵλ��
        if (locs-windowsize)>0
            bAccData{count} = aAccData(abs(floor(locs-windowsize)):abs(floor(locs+windowsize)),:);
            bGryData{count} = aGryData(abs(floor(locs-windowsize)):abs(floor(locs+windowsize)),:);
            count=count+1;
        end
    end
end
end

