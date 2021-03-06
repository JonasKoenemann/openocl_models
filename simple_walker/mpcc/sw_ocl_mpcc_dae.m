function sw_ocl_mpcc_dae(daeh, x, z, u, p)

q = [x.p; x.theta1; x.theta2; x.r1; x.r2];
qd = [x.v; x.theta1d; x.theta2d; x.r1d; x.r2d];
qdd = z.qdd;

lambda1_x = 0;
lambda1_y = z.lambda1_y;

lambda2_x = 0;
lambda2_y = 0;

% p1y = z.p1y;
% p2y = z.p2y;

% contact points (equations)
[p1,p2,v1,v2] = sw_model_fkine(q,qd,0*qd);

c1y_eq = p1(2) * lambda1_y-0.1;
% c2y_eq = p2(2) * lambda2_y-0.2;

% c1x_eq = lambda1_y * v1(1) - 0.1;
% c2x_eq = lambda2_y * v2(1) - 0.1;

% control inputs (with contact forces)
tau = u.tau;
r1tau = u.r1tau;
r2tau = u.r2tau;
sw_u = [tau;r1tau;r2tau;lambda1_x;lambda1_y;lambda2_x;lambda2_y];

M = sw_model_M(q);
fe = sw_model_fe(q, qd, sw_u);
C = sw_model_C(q, qd);

daeh.setODE('p', qd(1:2));
daeh.setODE('theta1', qd(3));
daeh.setODE('theta2', qd(4));
daeh.setODE('r1', qd(5));
daeh.setODE('r2', qd(6));

daeh.setODE('v', qdd(1:2));
daeh.setODE('theta1d', qdd(3));
daeh.setODE('theta2d', qdd(4));
daeh.setODE('r1d', qdd(5));
daeh.setODE('r2d', qdd(6));

daeh.setAlgEquation(M*qdd-C-fe);

daeh.setAlgEquation(c1y_eq);
% daeh.setAlgEquation(c2y_eq);
% daeh.setAlgEquation(c1x_eq);
% daeh.setAlgEquation(c2x_eq);

% daeh.setAlgEquation(p1y-p1(2));
% daeh.setAlgEquation(p2y-p2(2));