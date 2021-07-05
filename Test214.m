clc;
clear all;

X1=-2; Y1=3; Z1=11;
X2=-1.1; Y2=-2; Z2=4.823;
X3=2; Y3=12; Z3=3.146;

X1=-2.923; Y1=3.4; Z1=4.12;
X2=1.1234; Y2=2.2; Z2=2.223;
X3=-2.2234; Y3=-4.223; Z3=2.43;

x1=X1/Z1 ;y1=Y1/Z1 ;
x2=X2/Z2 ;y2=Y2/Z2 ;
x3=X3/Z3 ;y3=Y3/Z3 ; 

Round=10000;

ACD=GetACD(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,Round);
%Z10=6.2;Z20=3.5 ;Z30=2.146;
Z10=6.11; Z20=4.22 ;Z30=2.42;
Z10=1; Z20=1 ;Z30=1;

%Z10=0.1;Z20=0.1;Z03=0.1;  % Z0 deðerleri üsteki deðerlerle deðiðtirildiðinde sonuç doðru oluyor
h=5e-6;
DMax=0.8123;
Z0=[Z10 Z20 Z30]';
Z0a=Z0;
E0=TestErr( Z0,ACD )
EMax=10000;

% for i=1:20
% for ii=1:20
% for iii=1:20
% Za=0.5*[i ii iii]';
% E=TestErr( Za,ACD );
% if(E < EMax) EMax=E; Zaa=Za; end
% end
% end
% end
% EMax
% Zaa
% Z0=Zaa;

E=E0;
%Z0=Z0a;
i=1;
while (E > 1e-14)
B=GetB(Z0,ACD);
A=GetA(Z0,ACD,h);
D=inv(A)*B;
ZA1=Z0-DMax*D; 
ZA2=Z0-2*DMax*D;
ZA3=Z0-3*DMax*D;
ZA4=Z0-4*DMax*D;
E1=TestErr( ZA1,ACD );
E2=TestErr( ZA2,ACD );
E3=TestErr( ZA3,ACD );
E4=TestErr( ZA4,ACD );
Z0=ZA1;
E=E1;
if(E1 < E) E=E1; Z0=ZA1; end
if(E2 < E) E=E2; Z0=ZA2; end
if(E3 < E) E=E3; Z0=ZA3; end
if(E4 < E) E=E4; Z0=ZA4; end
i=i+1;
end
i
Z0
E


Xw= [x1 x2 x3 ; y1 y2 y3; 1 1 1];
xx=Xw(1,:);
yy=Xw(2,:);
zz=Xw(3,:);
figure;
plot3(xx, yy, zz, 'r+');

Xw= [X1 X2 X3 ; Y1 Y2 Y3; Z1 Z2 Z3];
xx=Xw(1,:);
yy=Xw(2,:);
zz=Xw(3,:);
figure;
plot3(xx, yy, zz, 'r+');












