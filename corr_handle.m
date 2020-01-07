function features = corr_handle(input_matrix)
    XYacorr = corr(input_matrix(:,1), input_matrix(:,2));
    XZacorr = corr(input_matrix(:,1), input_matrix(:,3));
    YZacorr = corr(input_matrix(:,2), input_matrix(:,3));
    
    features = [XYacorr, XZacorr, YZacorr];
end
