clc;
clear all;

X0=4; Y0=2; Z0=9.12;
a=5; b=2;c=5;

T1=2;T2=5;T3=8;

X1=X0+T1*a; Y1=Y0+T1*b; Z1=Z0+T1*c;
X2=X0+T2*a; Y2=Y0+T2*b; Z2=Z0+T2*c;
X3=X0+T3*a; Y3=Y0+T3*b; Z3=Z0+T3*c;

d1=sqrt((X0-X1)^2+(Y0-Y1)^2+(Z0-Z1)^2);
d2=sqrt((X0-X2)^2+(Y0-Y2)^2+(Z0-Z2)^2);
d3=sqrt((X0-X3)^2+(Y0-Y3)^2+(Z0-Z3)^2);

x0=X0/Z0; y0=Y0/Z0;
x1=X1/Z1; y1=Y1/Z1;
x2=X2/Z2; y2=Y2/Z2;
x3=X3/Z3; y3=Y3/Z3;

L=0.51;
a=a*L; b=b*L; c=c*L;

% fn1=a*(y1-y0)-b*(x1-x0)+c*(y1*(x1-x0)-x1*(y1-y0));
% fn2=a*(y2-y0)-b*(x2-x0)+c*(y2*(x2-x0)-x2*(y2-y0));
% fn3=a*(y3-y0)-b*(x3-x0)+c*(y3*(x3-x0)-x3*(y3-y0));

 A1=(y1-y0); B1=-(x1-x0) ;  C1=y1*(x1-x0)-x1*(y1-y0) ;
 A2=(y2-y0); B2=-(x2-x0) ;  C2=y2*(x2-x0)-x2*(y2-y0) ;
 A3=(y3-y0); B3=-(x3-x0) ;  C3=y3*(x3-x0)-x3*(y3-y0) ;

%    fn1=a*A1+b*B1+c*C1
%    fn2=a*A2+b*B2+c*C2
%    fn3=a*A3+b*B3+c*C3

   A=[A1,B1,C1;A2,B2,C2;A3,B3,C3];
     X=null(A);

 [U S V] = svd(A);
 U
 S
 V
x = V(:,3)



a=x(1);
b=x(2);
c=x(3);
fn1=a*A1+b*B1+c*C1
fn2=a*A2+b*B2+c*C2
fn3=a*A3+b*B3+c*C3

Z=sqrt((1/x(1))^2+(1/x(2))^2+(1/x(3))^2)

Z=sqrt(a^2+b^2+c^2)

T1=d1/Z
T2=d2/Z
T3=d3/Z

Z0a=T1*(b-c*y1)/(y1-y0)
