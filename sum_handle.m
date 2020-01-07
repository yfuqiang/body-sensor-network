function features = sum_handle(input_matrix)
    N = size(input_matrix,1);
    Xsum = sum(input_matrix(1:N,1));
    Ysum = sum(input_matrix(1:N,2));
    Zsum = sum(input_matrix(1:N,3));
    
    features = [Xsum, Ysum, Zsum];
end
