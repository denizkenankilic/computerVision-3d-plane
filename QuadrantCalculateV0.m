function [ZS1] = QuadrantCalculate(Z1,ACD )
%QUADRANTCALCULATE Summary of this function goes here
%   Detailed explanation goes here

a1=ACD(1);a2=ACD(2);a3=ACD(3);c1=ACD(4);c2=ACD(5);c3=ACD(6);
d1=ACD(7);d2=ACD(8);d3=ACD(9);

Z21=0; Z22=0; Z311=0; Z321=0; Z312=0; Z322=0; Z11=0; Z12=0; Z13=0; Z14=0; Z15=0; Z16=0; Z17=0; Z18=0;

a=a2;
b=-c1*Z1;
c=a1*Z1^2-d1^2; 
Z21=(-b-sqrt(b^2-4*a*c))/(2*a);
Z22=(-b+sqrt(b^2-4*a*c))/(2*a);
e11= sqrt(a1*Z1^2+a2*Z21^2-c1*Z1*Z21)-d1;
e12= sqrt(a1*Z1^2+a2*Z22^2-c1*Z1*Z22)-d1;


a=a3;
b=-c3*Z21;
c=a2*Z21^2-d3^2;
Z311=(-b-sqrt(b^2-4*a*c))/(2*a);
Z321=(-b+sqrt(b^2-4*a*c))/(2*a);
e31= sqrt(a2*Z21^2+a3*Z311^2-c3*Z21*Z311)-d3;
e32= sqrt(a2*Z21^2+a3*Z321^2-c3*Z21*Z321)-d3;


a=a3;
b=-c3*Z22;
c=a2*Z22^2-d3^2;
Z312=(-b-sqrt(b^2-4*a*c))/(2*a);
Z322=(-b+sqrt(b^2-4*a*c))/(2*a);
e33= sqrt(a2*Z22^2+a3*Z312^2-c3*Z22*Z312)-d3;
e34= sqrt(a2*Z22^2+a3*Z322^2-c3*Z22*Z322)-d3;


a=a1;
b=-c2*Z311;
c=a3*Z311^2-d2^2;
Z11=(-b-sqrt(b^2-4*a*c))/(2*a);
Z12=(-b+sqrt(b^2-4*a*c))/(2*a);
e21= sqrt(a1*Z11^2+a3*Z311^2-c2*Z11*Z311)-d2;
e22= sqrt(a1*Z12^2+a3*Z311^2-c2*Z12*Z311)-d2;


a=a1;
b=-c2*Z321;
c=a3*Z321^2-d2^2;
Z13=(-b-sqrt(b^2-4*a*c))/(2*a);
Z14=(-b+sqrt(b^2-4*a*c))/(2*a);
e21= sqrt(a1*Z13^2+a3*Z321^2-c2*Z13*Z321)-d2;
e22= sqrt(a1*Z14^2+a3*Z321^2-c2*Z14*Z321)-d2;


a=a1;
b=-c2*Z312;
c=a3*Z312^2-d2^2;
Z15=(-b-sqrt(b^2-4*a*c))/(2*a);
Z16=(-b+sqrt(b^2-4*a*c))/(2*a);
e21= sqrt(a1*Z15^2+a3*Z312^2-c2*Z15*Z312)-d2;
e22= sqrt(a1*Z16^2+a3*Z312^2-c2*Z16*Z312)-d2;


a=a1;
b=-c2*Z322;
c=a3*Z322^2-d2^2;
Z17=(-b-sqrt(b^2-4*a*c))/(2*a);
Z18=(-b+sqrt(b^2-4*a*c))/(2*a);
e21= sqrt(a1*Z17^2+a3*Z322^2-c2*Z17*Z322)-d2;
e22= sqrt(a1*Z18^2+a3*Z322^2-c2*Z18*Z322)-d2;

%Z21 Z22 Z311 Z321 Z312 Z322

%ZS= [Z21 Z22 Z311  Z321  Z312  Z322 Z11 Z12 Z13 Z14 Z15 Z16 Z17 Z18];
ZS1=[Z11 Z12 Z13 Z14 Z15 Z16 Z17 Z18];


end

