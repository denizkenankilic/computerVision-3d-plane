clc;
clear all;

%% *** Matris birlestirme *****
A1=[ 1 2 3 4 5 1 2 3 4 5];
B1=[5 6 7 8 9 5 6 7 8 9];
A2=[ 1 2 3 4 5; 1 2 3 4 5];
B2=[5 6 7 8 9; 5 6 7 8 9];

% c1=[A1 B1]
% c2=[A1;B1]
% c3=[A2 B2]
% c4=[A2;B2]


%% ** D�zlem Denklemi eldesi ***
P1=[-2 1 1];
P2=[0 2 3 ];
P3=[1 0 -1 ];

Plane=GetPlane(P1, P2, P3) ;  % Return is 4 number which [A, B, C, D]
p1=[P1 1] ;
p2=[P2 1] ;
p3=[P3 1] ;
% ******** Dogrulama *******
T1=Plane*p1';
T2=Plane*p2' ;
T3=Plane*p3' ;
%% ** Chess Board Hesaplamalar�** 
aci1=[10 10 10] * pi / 180;  T1=[ 0 0 8];  % CessBoard transform i�in aci, uzaklik atamasi yap
k = [ 532.574 0 318.264; 0 531.361 228.96;0 0 1];% kamera Matrisi
CessYD=3.2; %CessBoard Y D�zlem Uzunlugu
CessXD=CessYD*4/3; %CessBoard X D�zlem Uzunlugu
NumY=6;
NumX=8;
CessXd=CessXD/NumX; %cm boyutunda X d�zleminde bir kare uzunlu?u  (a)
CessYd=CessYD/NumY; %cm boyutunda Y d�zleminde bir kare uzunlu?u  (b)
%  CessBoard k�se degerlerini fiziksel olarak hesapla
PCess=GetCessBoard( CessYD, 4/3 , NumY,NumX );
[PN1 p1 R1]=GetTransform(aci1,T1,PCess);  % Transform et
i1=1;
i2=12;
i3=34;
 Xw=[PN1(1,i1) PN1(2,i1) PN1(3,i1);PN1(1,i2) PN1(2,i2) PN1(3,i2);PN1(1,i3) PN1(2,i3) PN1(3,i3) ]';
% Xw=k*p1';                                 % Kamera 2D d�zlemine aktar
xx=Xw(1,:);
yy=Xw(2,:);
zz=Xw(3,:);
figure;
plot3(xx, yy, zz, 'r+');

%% *** Qadrant Hesaplama****
acik=1;
if (acik==1)

X1=2.92355; X2=-1.1234; X3=2.2234;
Y1=-4.1; Y2=2.221;Y3=4.223;
Z1=2.412523;Z2=4.2122; Z3=3.21;

X1=PN1(1,i1); X2=PN1(1,i2); X3=PN1(1,i3);
Y1=PN1(2,i1); Y2=PN1(2,i2);Y3=PN1(2,i3);
Z1=PN1(3,i1);Z2=PN1(3,i2); Z3=PN1(3,i3);


x1=X1/Z1; y1=Y1/Z1;
x2=X2/Z2; y2=Y2/Z2;
x3=X3/Z3; y3=Y3/Z3;

% Z1 de?erini noktadan sonra �� haneden b�y�k olmayacak sekilde d�zenle
% Z1=Z1*1000;
% Z1=round(Z1)/1000;


% Quadrant Hesaplama i�in katsayilari ��z
RoundNum = 100;
ACD=GetACD(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3, RoundNum);
% Z degerlerini ��z
Count=2000;
Depth=10.0;
Esik=0.005
Esik1=Esik;
Esik2=Esik;
Esik3=0.1;
Z1S=FindZ1( ACD,0,1e5,Count,Depth,Esik1,Esik2,Esik3 ); % kont = 0 i�in 0 hata degerini verir. Aksi taktirde
                        % (kont = 1 ) potansiyel ��z�mlerin tamamimini verir.
                        % 1e5(Carp) hata carpani olarak kullanilir

Z1S;
end
%% **** Newthon Raphson ****

acik=1;
if (acik==1)

h=5e-3;
DMax=0.9123;
EMax=10000;
Size=size(Z1S);
iN=Size(1)

for i=1:iN

  Z10=Z1S(i,1);  Z20=Z1S(i,2) ;   Z30=Z1S(i,3) ;

Z0=[Z10 Z20 Z30]';
E0=TestErr( Z0,ACD );
E=E0;
ii=1;
while (E > 1e-10)
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
ii=ii+1;
end
AA(i,:)=Z0';
E;
ii;
end
AA
Z1S=AA;

for i=1:iN
X1=x1*Z1S(i,1);Y1=y1*Z1S(i,1);
X2=x2*Z1S(i,2);Y2=y2*Z1S(i,2);
X3=x3*Z1S(i,3);Y3=y3*Z1S(i,3);
Z1=Z1S(i,1);Z2=Z1S(i,2);Z3=Z1S(i,3);
X=[X1 X2 X3]
Y=[Y1 Y2 Y3]
Z=[Z1 Z2 Z3]

Xw= [X1 X2 X3 ; Y1 Y2 Y3; Z1 Z2 Z3];
xx=Xw(1,:);
yy=Xw(2,:);
zz=Xw(3,:);
figure;
plot3(xx, yy, zz, 'r+');
end

end
