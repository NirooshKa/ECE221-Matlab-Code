function [ integral ] = integral_simpson( x0, x1 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

n = 100000;
delta = (x1-x0)/n;

x = linspace(x0, x1, n);
y = x.^2;
integral = 0;
for k = 2:(n-1)
temp = (delta/3)*(y(k-1)+y(k)+y(k+1));
integral = integral + temp;




end

