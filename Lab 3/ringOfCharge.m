function [ Etot, Ex, Ey, Ez ] = RingOfCharge( a, rhol, x, y, z, N )
%RingOfCharge Summary of this function goes here
%  Etot: total Electrical field
%  a: radious of ring of charge
%  rhol: charge density of the line
%  x, y, z: coordinates of P

epsilon = 8.854e-12;

dphi = (2*pi)/N;

phi = linspace(0, 2*pi, N);

constant = (rhol*a)/(4*pi*epsilon);

divisor = ((x-a.*cos(phi)).^2 + (y-a.*sin(phi)).^2+z.^2).^(3/2);

dEx = dphi.*(x-a.*cos(phi))./divisor;
dEy = dphi.*(y-a.*sin(phi))./divisor;
dEz = dphi.*z./divisor;

Ex = constant.*sum(dEx);
Ey = constant.*sum(dEy);
Ez = constant.*sum(dEz);

Etot = (Ex^2+Ey^2+Ez^2)^0.5;


end

