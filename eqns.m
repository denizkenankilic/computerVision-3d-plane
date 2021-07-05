
function [result] = eqns(a1,a2,a3,c1,c2,c3,d1,d2,d3,guess)
%options = optimoptions('fsolve','Display','iter');
[result, fval, exit, output]=fsolve(@(z) eqns2(z,a1,a2,a3,c1,c2,c3,d1,d2,d3), guess,optimoptions('fsolve','Display','iter'));
output
end

function fcns = eqns2(z,a1,a2,a3,c1,c2,c3,d1,d2,d3)
fcns(1)= a1*z(1).^2+a2*z(2).^2-c1*z(1)*z(2)-d1;
fcns(2)= a1*z(1).^2+a3*z(3).^2-c2*z(1)*z(3)-d2;
fcns(3)= a2*z(2).^2+a3*z(3).^2-c3*z(2)*z(3)-d3;
end

