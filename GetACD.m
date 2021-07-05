function [ ACD] = GetACD( X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,RoundNum )
%GETACD Summary of this function goes here
%   Detailed explanation goes here
Carpan=1;

x1=Carpan*X1/Z1 ;y1=Carpan*Y1/Z1 ;
x2=Carpan*X2/Z2 ;y2=Carpan*Y2/Z2 ;
x3=Carpan*X3/Z3 ;y3=Carpan*Y3/Z3 ; 


x1=x1*RoundNum;
x1=round(x1)/RoundNum;
y1=y1*RoundNum;
y1=round(y1)/RoundNum;

x2=x2*RoundNum;
x2=round(x2)/RoundNum;
y2=y2*RoundNum;
y2=round(y2)/RoundNum;

x3=x3*RoundNum;
x3=round(x3)/RoundNum;
y3=y3*RoundNum;
y3=round(y3)/RoundNum;

a1=x1^2+y1^2+1;
a2=x2^2+y2^2+1;
a3=x3^2+y3^2+1;

c1=2*(x1*x2+y1*y2+1);
c2=2*(x1*x3+y1*y3+1);
c3=2*(x2*x3+y2*y3+1);

d1=sqrt((X1-X2)^2+(Y1-Y2)^2+(Z1-Z2)^2);
d2=sqrt((X1-X3)^2+(Y1-Y3)^2+(Z1-Z3)^2);
d3=sqrt((X2-X3)^2+(Y2-Y3)^2+(Z2-Z3)^2);

ACD=[a1,a2,a3,c1,c2,c3,d1,d2,d3];
end

