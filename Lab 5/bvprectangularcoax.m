function [V,Ex,Ey,C]= bvprectangularcoax(a,b,c,d,xo,yo,er,Vo)
%
% This function used the finite difference method to solve the
% two-dimensional electrostatic boundary value problem related to a square
% coaxial cable.
% a = width of outer conductor
% b = height of outer conductor
% c = width of inner conductor
% d = height of inner conductor
% xo = the x-coordinate of the location of the bottom left corner of the inner conductor
% yo = the y-coordinate of the location of the bottom left corner of the inner conductor
% er = the relative permittivity of the dielectric which fills the space
% between the inner and outer conductor
% Vo = electric potential of the inner conductor (outer is grounded)
% Define the fundamental constant eo
eo=8.854e-12;
% Set number of nodes and node spacings

Nx=101;
hx=a/(Nx-1);
hy=hx;
Ny=round(b/hx+1);


% Set the initial values of V to zero
V = zeros(Nx,Ny);
Vold = zeros(Nx,Ny);
maxdev = 1;

% Set the known potential values (or boundary values)
V(1,1:Ny)=0; % Grounded left side
V(1:Nx,1)=0; % Grounded bottom side
V(Nx,1:Ny)=0; % Grounded right side
V(1:Nx,Ny)=0; % Grounded top side

innerstartx=round(xo/hx+1);
innerendx=round(innerstartx+c/hx);
innerstarty=round(yo/hy+1);
innerendy=round(innerstarty+d/hy);

V(innerstartx:innerendx,innerstarty:innerendy)=Vo; % Set potentials of inner conductor

%%%%%%%%%%%%%%%%%%%%%%%%%%VOLTAGE CALCULATIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while maxdev > 10^(-4)
Vold=V; 
    for i=1:Nx-2
        for j=1:Ny-2
            
            V(i+1,j+1) =  (V(i+2,j+1) + V(i,j+1)+ V(i+1,j+2) + V(i+1,j))/(4);
            V(innerstartx:innerendx,innerstarty:innerendy)=Vo;
           
       end
    end
    maxdev=max(max(abs(100*(V-Vold)./(V))));
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%DRAWING THE E FIELD FIGURE %%%%%%%%%%%%%%%%%%%%%%%%%
[Ey,Ex] = gradient(-V,hx,hy);


%%%%%%%%%%%%%%%%CALCULATION FOR POTENTIAL DISTIBUTION FIGURE %%%%%%%%%%%%%
[gridpointsx,gridpointsy]=meshgrid(0:hx:a,0:hy:b);

size(gridpointsx)
size(Ex)

%%%%%%%%%%%%%%%%%DRAWING THE POTENTIAL DISTRIBUTION FIGURE%%%%%%%%%%%%%%%%%
figure
meshc(gridpointsx,gridpointsy,V');
figure 
contourf(gridpointsx,gridpointsy,V');

figure
quiver(gridpointsx,gridpointsy,Ex',Ey');


%%%%%%%%%%%%%%%%%%CAPACITANCE PER UNIT LENGTH CALCULATION%%%%%%%%%%%%%%%%%%
Q = 0;
C = 0;
for j=innerstarty-3:innerendy+3

Q = Q + (V(innerstartx-2,j)-V(innerstartx-3,j));
Q= Q+ (V(innerendx+2,j)-V(innerendx+3,j));

end

for i=innerstartx-3:innerendx+3
Q = Q + (V(i,innerstarty-2)-V(i,innerstarty-3));
Q = Q + (V(i,innerendy+2)-V(i,innerendy+3));
    
end

C = (1/Vo)*(Q*er*eo);

% innerx and innery are matrices that contains the x- and y-values of the
% locations of the nodes that relate to the inner conductor.
[innerx,innery]=meshgrid((innerstartx-1)*hx:hx:(innerendx-1)*hx,(innerstarty-1)*hy:hy:(innerendy-1)*hy);
% outerx and outery are matrices that contains the x- and y-values of the
% locations of the nodes that relate to the outer conductor.
outerx=[0:hx:a,zeros(1,Ny-2),a:-hx:0,zeros(1,Ny-2)];
outerx((Nx+1):(Nx+Ny-2))=a;
outery=[zeros(1,Nx),hy:hy:(b-hy),zeros(1,Nx),(b-hy):-hy:hy];
outery((Nx+Ny-1):(2*Nx+Ny-2))=b;

rectangle('Position',[ innerstartx innerstarty c d])

figure
plot(gridpointsx,gridpointsy,'b*');
hold;
plot(outerx,outery,'kd');
plot(innerx,innery,'ro');

We= 1/2*(C)*Vo^2

%double integral
We2= 1/2*er*eo*(Ex^2+Ey^2)*a*b




