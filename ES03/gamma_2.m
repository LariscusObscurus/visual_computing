function [itf] = gamma_2(rho, center, width)
    range = window(center, width);
    itf = range .^ rho;
end

