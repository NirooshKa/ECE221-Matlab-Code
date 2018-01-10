function [y]=myPlot(coefficients, x)
%input: coefficients of y(x)'s polynomial
%input: x's range

[nc, nr] = size(coefficients);
[nc_x, nr_x] = size(x);
y = zeros(nc_x,nr_x);

%keyboard

if nr == 1
        %legend = ['term1', 'term2','term3','term4']; 
        for k = 1:nc
            temp_y = (coefficients(k,1))*(x.^(k-1));
            
            %plot(x, temp_y, 'DisplayName', ['term +' num2str(k)]);
            plot(x, temp_y)
            hold on
            y = y + temp_y;
        end
else 
         for k = 1:nr
            temp_y = (coefficients(1,k))*(x.^(k-1));
            y = y + temp_y;
         end
end
 
plot(x,y);
%plot(x,y,'DisplayName','f(x)');
%legend('show');


%test:
%[y]=myPlot([4;0;-2;5], [-1:0.1:1]);
        