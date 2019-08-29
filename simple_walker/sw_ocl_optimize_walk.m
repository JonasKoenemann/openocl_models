% ocl version: c12a481db2e4d60b65f2c43e74986b4dac4a4491

opts = struct;
opts.ipopt = struct;
opts.ipopt.warm_start_init_point = 'yes';
opts.ipopt.mu_target = 0.1;
opts.ipopt.mu_init = 0.1;

solver = ocl.Solver(0.5, ...
  @sw_ocl_vars, ....
  @sw_ocl_ode, @sw_ocl_pathcost, 'N', 100, 'd', 2, ...
  'casadi_options', opts);

solver.setInitialState('p', [0; 1]);
solver.setInitialState('theta1', 0*pi/180);
solver.setInitialState('theta2', 20*pi/180);
solver.setInitialState('r1', 1);
solver.setInitialState('r2', 1);

solver.setInitialState('v', [1;0]);
solver.setInitialState('theta1d', 0);
solver.setInitialState('theta2d', 0);
solver.setInitialState('r1d', 0);
solver.setInitialState('r2d', 0);

solver.setEndBounds('theta1', 20*pi/180);
solver.setEndBounds('theta2', 0*pi/180);
solver.setEndBounds('r1', 1);
solver.setEndBounds('r2', 1);

solver.setEndBounds('v', [1;0]);
solver.setEndBounds('theta1d', 0);
solver.setEndBounds('theta2d', 0);
solver.setEndBounds('r1d', 0);
solver.setEndBounds('r2d', 0);

solver.setBounds('tau', -100, 100);
solver.setBounds('r1tau', -20, 20);
solver.setBounds('r2tau', -20, 20);

E_list = [200, 500, 1000];
solver.setParameter('E', E_list(1));
vars = solver.getInitialGuess;

for k=1:length(E_list)
  solver.setParameter('E', E_list(k));
  [vars, times] = solver.solve(vars);  
end


%% plot solution
if ~exist('record_video', 'var')
  record_video = false;
end

if record_video
  filename = ['sim_walker_', datestr(now,'yyyy-mm-dd_HHMMSS')];
  video_writer = VideoWriter(filename);
  video_writer.FrameRate = N/T;
  open(video_writer);
end

x_max = max(vars.states.p(:).value)+1;
[fig,handle] = simple_walker_draw_prepare([-x_max, x_max, -0.1, 2*x_max-0.1]);

t = times.states.value;

for k=2:length(t)
  
  x = vars.states{k};
  
  p = x.p.value;
  theta1 = x.theta1.value;
  theta2 = x.theta2.value;
  r1 = x.r1.value;
  r2 = x.r2.value;
  
  v = x.v.value;
  theta1d = x.theta1d.value;
  theta2d = x.theta2d.value;
  r1d = x.r1d.value;
  r2d = x.r2d.value;

  q = [p; theta1; theta2; r1; r2];
  qd = [v; theta1d; theta2d; r1d; r2d];
  
  simple_walker_draw_frame(handle, q, qd)
  
  if record_video
    frame = getframe(fig);
    writeVideo(video_writer, frame);
  end
  
  pause(t(k)-t(k-1))
  
end

if record_video
  close(video_writer)
end
