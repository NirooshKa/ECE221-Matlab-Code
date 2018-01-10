t = linspace (0,10);

v1 = e.^(-0.5.*t).*sin(4.*t);
v2 = e.^(-0.25.*t).*cos(4.*t);

subplot (2,1,1);
plot (t,v1);
axis ([0 5 -1 1]);
title ('Sinusoid 1');
legend ('v1');
xlabel ('Time (s)');
ylabel ('Voltage (V)');

subplot (2,1,2);
plot (t,v2);
axis ([0 5 -1 1]);
title ('Sinusoid 2');
legend ('v2');
xlabel ('Time (s)');
ylabel ('Voltage (V)');