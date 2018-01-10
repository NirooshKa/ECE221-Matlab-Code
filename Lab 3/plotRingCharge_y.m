function [ Etot, Ex, Ey, Ez ] = plotringcharge_y( a, Q, y, N )
epsilon = 8.854e-12;
rhol = Q/(2*pi*a);
x = 0;
z = 0;

for i = 1:length(y)
[ Etot(i), Ex(i), Ey(i), Ez(i) ] = RingOfCharge( a, rhol, x, y(i), z, N );
end


figure

plot (y, Ex,'-b', y, Ey, '-g', y, Ez, '-r');

grid on
xlabel('y');
ylabel('E');
legend('Ex','Ey', 'Ez');

%graph is weird.

end

