function features = std_handle(input_matrix)
    Xstd = std(input_matrix(:,1));
    Ystd = std(input_matrix(:,2));
    Zstd = std(input_matrix(:,3));
    
    features = [Xstd, Ystd, Zstd];
end
