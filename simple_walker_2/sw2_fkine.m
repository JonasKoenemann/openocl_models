function [out1,out2,out3,out4] = sw2_fkine(in1,in2,in3)
%SW2_FKINE
%    [OUT1,OUT2,OUT3,OUT4] = SW2_FKINE(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    28-Sep-2019 19:38:26

px = in1(1,:);
py = in1(2,:);
r1 = in1(5,:);
r2 = in1(6,:);
r1d = in2(5,:);
r2d = in2(6,:);
theta1 = in1(3,:);
theta2 = in1(4,:);
theta1d = in2(3,:);
theta2d = in2(4,:);
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
    out3 = [vx+r1d.*t2+r1.*t3.*theta1d;vy-r1d.*t3+r1.*t2.*theta1d];
end
if nargout > 3
    out4 = [vx+r2d.*t4+r2.*t5.*theta2d;vy-r2d.*t5+r2.*t4.*theta2d];
end
