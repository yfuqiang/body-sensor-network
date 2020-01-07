function [winNum] = huadongchuangnum(input_matrix)
PreWinGry=input_matrix(:,[1 2 3]);
PreWinAcc=input_matrix(:,[4 5 6]);
windowsize=500; %滑动窗口大小！！！！！！！！！！！！！！！！！！！！！！！！！！！
winNum=floor(length(input_matrix)/windowsize);
thresold=mean(abs(PreWinAcc(:,1)))*2;  %判断是否有击球的阈值，根据幅值去改！！！！
countnum=1; %计算峰值次数
WinGryData=cell(1,10);
WinAccData=cell(1,10);

for m=1:(winNum-1)
%     WinGryData=PreWinGry(m*windowsize:m*windowsize+windowsize,:);
%     WinAccData=PreWinAcc(m*windowsize:m*windowsize+windowsize,:);
%     m
    ifvalue = any(findpeaks(abs(PreWinAcc((m-1)*windowsize+1:m*windowsize+1,1))) > thresold);
    if ifvalue
        [pks,locs] = findpeaks(abs(PreWinAcc((m-1)*windowsize+1:m*windowsize+1,1)));
        [Y,Ip]=max(pks);
        locs=locs(Ip)+(m-1)*windowsize;
        if (locs-windowsize)>0
            WinGryData{countnum} = PreWinGry(abs(floor(locs-windowsize)):abs(floor(locs+windowsize)),:);
            WinAccData{countnum} = PreWinAcc(abs(floor(locs-windowsize)):abs(floor(locs+windowsize)),:);
            countnum=countnum+1;

        end
    end
    %m=m+1;
    %any(findpeaks(abs(PreWinAcc(1*windowsize+1:2*windowsize+1,1))) > mean(PreWinAcc(:,1))*20)
end



end


