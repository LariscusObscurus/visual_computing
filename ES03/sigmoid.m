function [itf] = sigmoid(center, width)
    center = center / 255;
    width = width / 255;
    grayvalues = linspace(0, 1, 256);
    itf = (1./(1+exp(-((grayvalues-center)./(width/2)))));
end

