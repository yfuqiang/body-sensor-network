function [bGryData] = huadongchuangGry(input_matrix)
aAccData=input_matrix(:,[1 2 3]);%取1~3列
aGryData=input_matrix(:,[4 5 6]);%取4~6列
windowsize=500; %设置滑动窗口大小
windowsNum=floor(length(input_matrix)/windowsize);%滑动窗口数
thresold=mean(abs(aGryData(:,1)))*2;  %设定阈值
bAccData=cell(1,10);
bGryData=cell(1,10);
count=1; %峰值次数
for m=1:(windowsNum-1)
    ifvalue = any(findpeaks(abs(aGryData((m-1)*windowsize+1:m*windowsize+1,1))) > thresold);
    if ifvalue
        [pks,locs] = findpeaks(abs(aGryData((m-1)*windowsize+1:m*windowsize+1,1)));
        [Y,Ip]=max(pks);
        locs=locs(Ip)+(m-1)*windowsize;%得到最大值位置
        if (locs-windowsize)>0
            bAccData{count} = aAccData(abs(floor(locs-windowsize)):abs(floor(locs+windowsize)),:);
            bGryData{count} = aGryData(abs(floor(locs-windowsize)):abs(floor(locs+windowsize)),:);
            count=count+1;
        end
    end
end
end

