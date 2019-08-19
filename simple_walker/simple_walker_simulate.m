px = 0;
py = 4; 
theta1 = 10*pi/180;
theta2 = -10*pi/180;
r1 = 1;
r2 = 1;

q = [px;py;theta1;theta2;r1;r2];
qd = zeros(6,1);

y = [q;qd];

tspan = linspace(0,5,100);
options = odeset('Mass', @(t,y) blkdiag(eye(6), sw_model_M(y(1:6))) );
[t,Y] = ode45(@simple_walker_ode, tspan, y, options);

% draw
h = simple_walker_draw_prepare();
q = y(1:6);
simple_walker_draw_frame(h,q);

for k=2:size(Y,1)
  y = Y(k,:)';
  q = y(1:6);
  simple_walker_draw_frame(h,q);
  pause(t(k)-t(k-1))
end

