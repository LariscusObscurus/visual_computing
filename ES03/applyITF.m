function [ out ] = applyITF( image, itf)
    out = itf(image + 1);
end

