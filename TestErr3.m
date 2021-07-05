function [ e3 ] = TestErr3( z1,z2,z3,ACD )
%TESTERR Summary of this function goes here
%   Detailed explanation goes here

a1=ACD(1);
a2=ACD(2); 
a3=ACD(3);

c1=ACD(4); c2=ACD(5); c3=ACD(6);
d1=ACD(7); d2=ACD(8); d3=ACD(9);

e1= sqrt(a1*z1^2+a2*z2^2-c1*z1*z2)-d1;
e2= sqrt(a1*z1^2+a3*z3^2-c2*z1*z3)-d2;
e3= sqrt(a2*z2^2+a3*z3^2-c3*z2*z3)-d3;

E=sqrt(e1^2+e2^2+e3^2);
end

