x = [-1:0.05:1];
y = [-2:0.05:2];

[X,Y] =  meshgrid(x,y);
fxy = 1./(1+(X.^2+Y.^2).^0.5);

figure
mesh(X,Y,fxy);
xlabel('x axis');
ylabel('y axis');
zlabel('f_{xy}');



%to show 3 fxy based on fixed y

figure
y = -2;
[X,Y] =  meshgrid(x,y);
fxy = 1./(1+(X.^2+Y.^2).^0.5);
plot(x, fxy);
legend('y=-2');

xlabel('x axis');
ylabel('fxy');

hold on

y = 0;
[X,Y] =  meshgrid(x,y);
fxy = 1./(1+(X.^2+Y.^2).^0.5);
plot(x, fxy);
legend('y=0');

hold on

y = 1.6;
[X,Y] =  meshgrid(x,y);
fxy = 1./(1+(X.^2+Y.^2).^0.5);
plot(x, fxy);
legend('y=-2', 'y=0','y=1.6');


% find


y = [-2:0.05:2];

[r,c] = find(y==1.6)
