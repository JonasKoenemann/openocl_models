function [out1,out2,out3,out4,out5,out6] = sw_model_fkine(in1,in2,in3)
%SW_MODEL_FKINE
%    [OUT1,OUT2,OUT3,OUT4,OUT5,OUT6] = SW_MODEL_FKINE(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    10-Sep-2019 17:45:03

ax = in3(1,:);
ay = in3(2,:);
px = in1(1,:);
py = in1(2,:);
r1 = in1(5,:);
r2 = in1(6,:);
r1d = in2(5,:);
r2d = in2(6,:);
r1dd = in3(5,:);
r2dd = in3(6,:);
theta1 = in1(3,:);
theta2 = in1(4,:);
theta1d = in2(3,:);
theta2d = in2(4,:);
theta1dd = in3(3,:);
theta2dd = in3(4,:);
vx = in2(1,:);
vy = in2(2,:);
t2 = sin(theta1);
t3 = cos(theta1);
out1 = [px+r1.*t2;py-r1.*t3];
if nargout > 1
    t4 = sin(theta2);
    t5 = cos(theta2);
    out2 = [px+r2.*t4;py-r2.*t5];
end
if nargout > 2
    t6 = r1.*t2.*theta1d;
    t7 = r1d.*t2;
    t8 = r1.*t3.*theta1d;
    out3 = [t7+t8+vx;t6+vy-r1d.*t3];
end
if nargout > 3
    t9 = r2.*t4.*theta2d;
    t10 = r2d.*t4;
    t11 = r2.*t5.*theta2d;
    out4 = [t10+t11+vx;t9+vy-r2d.*t5];
end
if nargout > 4
    out5 = [ax+r1dd.*t2-theta1d.*(t6-r1d.*t3)+r1.*t3.*theta1dd+r1d.*t3.*theta1d;ay+theta1d.*(t7+t8)-r1dd.*t3+r1.*t2.*theta1dd+r1d.*t2.*theta1d];
end
if nargout > 5
    out6 = [ax+r2dd.*t4-theta2d.*(t9-r2d.*t5)+r2.*t5.*theta2dd+r2d.*t5.*theta2d;ay+theta2d.*(t10+t11)-r2dd.*t5+r2.*t4.*theta2dd+r2d.*t4.*theta2d];
end
