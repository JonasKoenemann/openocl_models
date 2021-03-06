function barrier_contact

  x0 = [1,0];
  t = [0 3];
  [t,x]= ode45(@ode, t, x0);
  
  figure
  ph = plot(0, 0, 'o');
  ylim([-1,10])
  for k=2:size(x,1)
    set(ph, 'Ydata', x(k, 1))
    pause(t(k)-t(k-1))
  end
  
  figure 
  plot(t,x(:,1))

end

function dx = ode(t,x)

  p = x(1);
  v = x(2);
  
  h = -p;
  
  if h > 0
    force = 1e12;
  else
    force = -reallog(-h);
  end

  dx = zeros(2,1);
  dx(1) = v;
  dx(2) = force - 9.81 - min(force,100)*v;

end