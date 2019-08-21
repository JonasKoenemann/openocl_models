function G = gravload(rob,in2)
%% GRAVLOAD - Computation of the configuration dependent vector of gravitational load forces/torques for Puma 560 
% ========================================================================= 
%    
%    G = gravload(rob,q) 
%    G = rob.gravload(q) 
%    
%  Description:: 
%    Given a full set of joint variables this function computes the 
%    configuration dependent vector of gravitational load forces/torques. 
%    
%  Input:: 
%    rob: robot object of Puma 560 specific class 
%    q:  6-element vector of generalized 
%         coordinates 
%    Angles have to be given in radians! 
%    
%  Output:: 
%    G:  [6x1] vector of gravitational load forces/torques 
%    
%  Example:: 
%    --- 
%    
%  Known Bugs:: 
%    --- 
%    
%  TODO:: 
%    --- 
%    
%  References:: 
%    1) Robot Modeling and Control - Spong, Hutchinson, Vidyasagar 
%    2) Modelling and Control of Robot Manipulators - Sciavicco, Siciliano 
%    3) Introduction to Robotics, Mechanics and Control - Craig 
%    4) Modeling, Identification & Control of Robots - Khalil & Dombre 
%    
%  Authors:: 
%    This is an autogenerated function! 
%    Code generator written by: 
%    Joern Malzahn 
%    2012 RST, Technische Universitaet Dortmund, Germany 
%    http://www.rst.e-technik.tu-dortmund.de 
%    
%  See also inertia.
%    
    
% Copyright (C) 1993-2019, by Peter I. Corke 
% Copyright (C) 2012-2019, by Joern Malzahn 
% 
% This file has been automatically generated with The Robotics Toolbox for Matlab (RTB). 
% 
% RTB and code generated with RTB is free software: you can redistribute it and/or modify 
% it under the terms of the GNU Lesser General Public License as published by 
% the Free Software Foundation, either version 3 of the License, or 
% (at your option) any later version. 
%  
% RTB is distributed in the hope that it will be useful, 
% but WITHOUT ANY WARRANTY; without even the implied warranty of 
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
% GNU Lesser General Public License for more details. 
%  
% You should have received a copy of the GNU Leser General Public License 
% along with RTB.  If not, see <http://www.gnu.org/licenses/>. 
% 
% http://www.petercorke.com 
% 
% The code generation module emerged during the work on a project funded by 
% the German Research Foundation (DFG, BE1569/7-1). The authors gratefully  
% acknowledge the financial support. 

%% Bugfix
%  In some versions the symbolic toolbox writes the constant $pi$ in
%  capital letters. This way autogenerated functions might not work properly.
%  To fix this issue a local variable is introduced:
PI = pi;
   




%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    10-Jul-2019 14:06:05

q2 = in2(:,2);
q3 = in2(:,3);
q4 = in2(:,4);
q5 = in2(:,5);
t2 = cos(q2);
t3 = cos(q3);
t4 = sin(q2);
t5 = sin(q3);
t6 = cos(q5);
t7 = cos(q4);
t8 = sin(q5);
t9 = t2.*t3.*2.4892875e-1;
t10 = t4.*t5.*t7.*t8.*2.82528e-2;
G = [0.0,t2.*3.72347379e1-t4.*1.024164+t9+t10-t2.*t5.*8.7439473-t3.*t4.*8.7439473-t4.*t5.*2.4892875e-1-t2.*t5.*t6.*2.82528e-2-t3.*t4.*t6.*2.82528e-2-t2.*t3.*t7.*t8.*2.82528e-2,t9+t10-t2.*t5.*8.7439473-t3.*t4.*8.7439473-t4.*t5.*2.4892875e-1-t2.*t5.*t6.*2.82528e-2-t3.*t4.*t6.*2.82528e-2-t2.*t3.*t7.*t8.*2.82528e-2,t8.*sin(q2+q3).*sin(q4).*2.82528e-2,t2.*t3.*t8.*(-2.82528e-2)+t4.*t5.*t8.*2.82528e-2-t2.*t5.*t6.*t7.*2.82528e-2-t3.*t4.*t6.*t7.*2.82528e-2,0.0];