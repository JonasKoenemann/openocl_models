
ocp = ocl.Problem(0.6, ...
  @sw_ocl_mpcc_vars, ....
  @sw_ocl_mpcc_dae, @sw_ocl_mpcc_pathcost, 'N', 20, 'd', 2);

ocp.setInitialState('p', [0;1.1]);
ocp.setInitialState('theta1', 0*pi/180);
ocp.setInitialState('theta2', 50*pi/180);
ocp.setInitialState('r1', 1);
ocp.setInitialState('r2', 1);

ocp.setInitialState('v', [0;0]);
ocp.setInitialState('theta1d', 0);
ocp.setInitialState('theta2d', 0);
ocp.setInitialState('r1d', 0);
ocp.setInitialState('r2d', 0);

% ocp.setEndBounds('theta1', 20*pi/180);
% ocp.setEndBounds('theta2', 0*pi/180);
% ocp.setEndBounds('r1', 1);
% ocp.setEndBounds('r2', 1);
% 
% ocp.setEndBounds('v', [1;0]);
% ocp.setEndBounds('theta1d', 0);
% ocp.setEndBounds('theta2d', 0);
% ocp.setEndBounds('r1d', 0);
% ocp.setEndBounds('r2d', 0);

ocp.setBounds('tau', 0);
ocp.setBounds('r1tau', 0);
ocp.setBounds('r2tau', 0);

ocp.setBounds('lambda1_y', 0, inf);
% ocp.setBounds('lambda2_y', 0, inf);
% ocp.setBounds('p1y', 0, inf);
% ocp.setBounds('p2y', 0, inf);

vars = ocp.getInitialGuess();

vars.states.p.set([0;1.4]);
vars.states.theta1.set(0*pi/180);
vars.states.theta2.set(50*pi/180);
vars.states.r1.set(1);
vars.states.r2.set(1);

vars.integrator.algvars.lambda1_y.set(1);
% vars.integrator.algvars.lambda2_y.set(0);
% 
% vars.integrator.algvars.p1y.set(0.1);
% vars.integrator.algvars.p2y.set(0.1);

[vars, times] = ocp.solve(vars); 

%% plot solution 
if ~exist('record_video', 'var')
  record_video = false;
end

if record_video
  filename = ['movie/sim_walker_', datestr(now,'yyyy-mm-dd_HHMMSS')];
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

