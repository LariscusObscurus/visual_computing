function [out, itf] = posterize(image, levels)

    grayvalues = linspace(0, 1, levels);
    grayvalues = repmat(grayvalues, round(255/levels), 1);
    itf = reshape(grayvalues, [], 1);
    
    out = applyITF(image, itf);
end

