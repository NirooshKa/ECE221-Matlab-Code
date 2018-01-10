function [ ET,V ] = sphereofcharge()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   Detailed explanation goes here
% a,rhos,x,y,z,N )
epsilon = 8.85e-12;
V =  zeros (1,100);
ET= zeros (1,100);
Ex =  zeros (1,100);
Ey= zeros (1,100);
Ez = zeros (1,100);
z= linspace (-3, 3, 100);

for i=1:100
[a,b,c,d,e] = sphere(0.5,2*10^(-6),0,0,z(i),200);

V(i) = a;
ET(i)=b;
Ex(i) =c;
Ey(i) =d;
Ez(i) =e;

end

% ANOTHER IMPLEMENTATION
% for i=1:100
% if(y(i) < 0.5 && y(i) > -0.5)
%     ETt(i) = 0;
%     Vt(i) = 2*10^(-6)*0.5/epsilon;
% else
%     ETt(i) = 2*10^(-6)*0.5^2/(epsilon*y(i).^2);
%     Vt(i) = 2*10^(-6)*0.5^2/(epsilon*abs(y(i)));
% end
% end

figure 
hold on
plot (z, ET, 'r')
plot (z, V, 'b')
plot (z, Ex, 'g')
plot (z, Ey, 'm')
plot (z, Ez, 'c')

legend('Et','V','Ex','Ey','Ez');
hold off

% figure

% hold on
% plot(y,V,'ro');
% plot (y, Vt,'b-'); 
% legend('V','V theoretical')
% hold off

end
