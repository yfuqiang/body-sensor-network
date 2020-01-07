function features = kurtosis_handle(input_matrix)
   Xskew = kurtosis(input_matrix(:,1));
   Yskew = kurtosis(input_matrix(:,2));
   Zskew = kurtosis(input_matrix(:,3));
    
   features = [Xskew, Yskew, Zskew];
end
