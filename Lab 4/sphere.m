function [Voltage,Etot,ExT,EyT,EzT]  = sphere( a,rhos,x,y,z,N )
dtheta = pi/N;
dphi = 2*pi/N;
phi = linspace(dphi,2*pi,N);
theta = linspace(0,pi,N+1);
epsilon0 = 8.85e-12;
for e=1:length(phi)
 for m=1:length(theta)
 integrand = rhos*a^2*sin(theta(m))*dtheta*dphi/(4*pi*epsilon0*((x-a*sin(theta(m))*cos(phi(e)))^2+(y-a*sin(theta(m))*sin(phi(e)))^2+(z-a*cos(theta(m)))^2)^(3/2));
 Ex(m)=x-a*sin(theta(m))*cos(phi(e));
 Ey(m)=y-a*sin(theta(m))*sin(phi(e));
 Ez(m)=z-a*cos(theta(m));
 end
 Ext(e)=sum(Ex);
 Eyt(e)=sum(Ey);
 Ezt(e)=sum(Ez);
end
ExT = sum(Ext);
EyT = sum(Eyt);
EzT = sum(Ezt);

Etot = sqrt(ExT^2+EyT^2+EzT^2);

%*********************************VOLTAGE***************************************%
for e=1:length(phi)
 for m=1:length(theta)
 V = rhos*a^2*sin(theta(m))*dtheta*dphi/(4*pi*epsilon0*((x-a*sin(theta(m))*cos(phi(e)))^2+(y-a*sin(theta(m))*sin(phi(e)))^2+(z-a*cos(theta(m)))^2)^(1/2));
 end
 Vt(e)=sum(V);
end
Voltage = sum(Ext);

