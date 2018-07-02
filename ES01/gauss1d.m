%%
function [ y ] = gauss1d(x, rho)
tmp = 1 / sqrt(2 * pi * rho);
y = tmp * exp(- (x .^ 2) / (2 * rho ^ 2));
end
%%