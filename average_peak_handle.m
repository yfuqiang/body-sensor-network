function features = average_peak_handle(input_matrix)
    [peaks, locations] = findpeaks(input_matrix(:,1)');
    Xap = mean(peaks);
    [peaks, locations] = findpeaks(input_matrix(:,2)');
    Yap = mean(peaks);
    [peaks, locations] = findpeaks(input_matrix(:,3)');
    Zap = mean(peaks);
    
    features = [Xap, Yap, Zap];
end