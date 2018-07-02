function [threshold] = optimal_threshold(image)
    %iterative optimal threshold
    
    %mean intensity of the histogram
    [counts, binLocations] = imhist(image, 256);
    
    %calculate initial threshold values
    diagonal = diag(image);
    flipped_diagonal = diag(flip(image));
    background_sum = sum([diagonal(1), diagonal(end), flipped_diagonal(1), flipped_diagonal(end)]);
    background_mean = background_sum / 4;

    foreground_sum = sum(sum(image)) - background_sum;
    foreground_mean = foreground_sum / (numel(image) - 4);

  

    current_threshold = (foreground_mean+background_mean)/2;
    previous_threshold = 0;
    
    i = 1;
    while abs(current_threshold-previous_threshold)>=1

        mu_back = cumsum(counts(1:current_threshold));
        background_mean = sum( binLocations(1:current_threshold).*counts(1:current_threshold)) / mu_back(end);

        mu_foreground = cumsum(counts(current_threshold:end));
        foreground_mean = sum( binLocations(current_threshold:end).*counts(current_threshold:end)) / mu_foreground(end);
        i=i+1;

        previous_threshold = current_threshold;
        current_threshold = (foreground_mean+background_mean)/2;
    end
    threshold = current_threshold;
end

