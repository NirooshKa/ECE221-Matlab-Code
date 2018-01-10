function [ Etot, Ex, Ey, Ez ] = plotringcharge( a, Q, z, N )



epsilon = 8.854e-12;
rhol = Q/(2*pi*a);
x = 0;
y = 0;

for i = 1:length(z)
[ Etot(i), Ex(i), Ey(i), Ez(i) ] = RingOfCharge( a, rhol, x, y, z(i), N );
end


Etheory = rhol.*a.*z./(2*epsilon*(a.^2+z.^2).^1.5);



% plot(z, Ez,'-b');
% hold on
% plot (z, Etheory,'or');

plot (z, Ez,'-b', z, Etheory, 'ro')

grid on
xlabel('z');
ylabel('Ez');
legend('Ez','Etheory');

%graph is weird.



end

