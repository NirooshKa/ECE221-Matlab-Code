function [ sum ] = integral( x1, x2 )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

n = 1000;
delta = (x2 - x1)/n;
 x = linspace(x1,x2,n);
 y = x.^2;
%keyboard
sum = 0;

for k = 1:(n-1)
      tempSum = delta.*y(k);
     sum = sum + tempSum;
   
end

