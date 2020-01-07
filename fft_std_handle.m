function features = fft_std_handle(input_matrix)
    input_matrix(:,1) = fft(input_matrix(:,1));
    input_matrix(:,2) = fft(input_matrix(:,2));
    input_matrix(:,3) = fft(input_matrix(:,3));
    
    Xstd = std(input_matrix(:,1));
    Ystd = std(input_matrix(:,2));
    Zstd = std(input_matrix(:,3));
    
    features = [Xstd, Ystd, Zstd];
end
