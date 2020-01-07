function feature = laji(input_matrix)
feature=zeros(1,12);
std_handle(input_matrix);
feature(1,1:3)=ans;
sum_handle(input_matrix);
feature(1,4:6)=ans;
corr_handle(input_matrix);
feature(1,7:9)=ans;
fft_std_handle(input_matrix);
feature(1,10:12)=ans;
average_peak_handle(input_matrix)
feature(1,13:15)=ans;
kurtosis_handle(input_matrix);
feature(1,16:18)=ans;
end


