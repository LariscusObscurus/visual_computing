function [result] = mode_method(image)

    counts = imhist(image);
    size = 5;
    mask = linspace(1/size, 1/size, size);
    counts = conv(counts, mask, 'same');
    maxima{1} = [0, 1];
    maxima{2} = [0, 1];
    for i = 2:254
        if (counts(i-1) < counts(i) && counts(i+1) < counts(i))
            if (counts(i) >  maxima{1}(1))
                maxima{1} = [counts(i), i];
            elseif (counts(i) > maxima{2}(1))
                maxima{2} = [counts(i), i];
            end
        end
    end
    result = ((maxima{1}(2) + maxima{2}(2)) / 2) / 256;
end

