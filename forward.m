function [f,w,JPos] = forward(q)

w = [0 0 1 0;...
     1 0 0 0;...
     0 1 0 0;...
     0 0 0 1];
a = zeros(1,7);
d = [340,0,400,0,400,0,126]./1000;
alpha = [-pi/2,pi/2,pi/2,-pi/2,-pi/2,pi/2,0];

for i=1:7
    T = [cos(q(i))    -sin(q(i))*cos(alpha(i))   sin(q(i))*sin(alpha(i))   a(i)*cos(q(i));...
         sin(q(i))    cos(q(i))*cos(alpha(i))    -cos(q(i))*sin(alpha(i))  a(i)*sin(q(i));...
         0            sin(alpha(i))              cos(alpha(i))             d(i);...
         0            0                          0                         1];
%     JPos(:,i) = simplify([T(1,4), T(2,4), T(3,4)]');
    w = w*T;
    JPos(:,i) = [w(1,4), w(2,4), w(3,4)]';
end

rolli = atan2(w(2,3),w(1,3));
pitchi = atan2(sqrt(w(2,3)^2+w(1,3)^2),w(3,3));
yawi = atan2(w(3,2),-w(3,1));
f = [w(1,4),w(2,4),w(3,4),rolli,pitchi,yawi]';

end