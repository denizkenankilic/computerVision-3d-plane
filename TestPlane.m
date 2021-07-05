clc;
clear all;

%% Transform edilmis Chess degerlerini olustur.
aci1=[5 5 -5] * pi / 180;  T1=[ 1 2 12];  % CessBoard transform için aci, uzaklik atamasi yap 
k = [ 532.574 0 318.264; 0 531.361 228.96;0 0 1];% kamera Matrisi 
CessYD=30; %CessBoard Y Düzlem Uzunlugu 
Oran=3/4;NumY=8;NumX=6;
%  CessBoard köse degerlerini fiziksel olarak hesapla
PCess=GetCessBoard( CessYD, Oran, NumY,NumX );
[PN1 p1 R1]=GetTransform(aci1,T1,PCess);  % Transform et
Xw=PN1; 
xx=Xw(1,:); yy=Xw(2,:); zz=Xw(3,:);
figure; plot3(xx, yy, zz, 'r+');
Xw= k*p1; 
%Xw= k*p1; 
xx=Xw(1,:); yy=Xw(2,:); zz=Xw(3,:);
figure; plot3(xx, yy, zz, 'r+');

%% ** Düzlem Denklemi eldesi *** 
%Cess uzerinden arstgele uc nokta sec
i1=1; i2=22; i3=41;
Xw=[PN1(1,i1) PN1(2,i1) PN1(3,i1);PN1(1,i2) PN1(2,i2) PN1(3,i2);PN1(1,i3) PN1(2,i3) PN1(3,i3) ]';
% xx=Xw(1,:); 
% yy=Xw(2,:);
% zz=Xw(3,:);
% figure;
% plot3(xx, yy, zz, 'r+');

P1=Xw(:,1)'
P2=Xw(:,2)'
P3=Xw(:,3)'

Plane=GetPlane(P1, P2, P3)   % Return is 4 number which [A, B, C, D] 
p1=[P1 1] ;
p2=[P2 1] ;
p3=[P3 1] ;
% ******** Dogrulama *******
T1=Plane*p1' 
T2=Plane*p2' 
T3=Plane*p3' 

% Rastgele nokta secimi ve duzlemi saglad?g?n?n dogrulamas?
iN=28;
P=[PN1(1,iN) PN1(2,iN) PN1(3,iN)]
P=[P 1];
TN=Plane*P'
%% ** Transform Oncesi ve Sonrasi iki nokta aras? uzakl?g?n degismediginin dogrulmas?
i1=1;
i2=42;
p1=PCess(:,i1)
p2=PCess(:,i2)
d=sqrt((p1(1)-p2(1))^2+(p1(2)-p2(2))^2+(p1(3)-p2(3))^2)

p1=PN1(:,i1)
p2=PN1(:,i2)
d=sqrt((p1(1)-p2(1))^2+(p1(2)-p2(2))^2+(p1(3)-p2(3))^2)

%% ** Düzlem Denkleminin Transformasyon Oncesi ve Sonras? ayn? noktalardan  eldesi *** 
% %Cess uzerinden arstgele uc nokta sec
% i1=1; i2=22; i3=41;
% Xw=[PCess(1,i1) PCess(2,i1) PCess(3,i1);PCess(1,i2) PCess(2,i2) PCess(3,i2);PCess(1,i3) PCess(2,i3) PCess(3,i3) ]';
% Xw1=[PN1(1,i1) PN1(2,i1) PN1(3,i1);PN1(1,i2) PN1(2,i2) PN1(3,i2);PN1(1,i3) PN1(2,i3) PN1(3,i3) ]';
% 
% P1=Xw(:,1)'
% P2=Xw(:,2)'
% P3=Xw(:,3)'
% 
% Plane=GetPlane(P1, P2, P3)   % Return is 4 number which [A, B, C, D] 
% 
% P1=Xw1(:,1)'
% P2=Xw1(:,2)'
% P3=Xw1(:,3)'
% 
% Plane=GetPlane(P1, P2, P3)   % Return is 4 number which [A, B, C, D]

