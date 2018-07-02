function [ itf ] = window( center, width )
    itf = zeros(1, 256);
    itf(center-width:center+width) = linspace(0, 1, width*2+1);
end

