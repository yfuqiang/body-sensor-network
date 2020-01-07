function features = fft_sum_handle(input_matrix)
    input_matrix(:,1) = fft(input_matrix(:,1));
    input_matrix(:,2) = fft(input_matrix(:,2));
    input_matrix(:,3) = fft(input_matrix(:,3));
    
    N = size(input_matrix,1);
    Xsum = sum(input_matrix(1:N,1));
    Ysum = sum(input_matrix(1:N,2));
    Zsum = sum(input_matrix(1:N,3));
    
    features = [Xsum, Ysum, Zsum];
end