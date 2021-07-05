function [ PCess ] = GetCessBoard( CessYD, XYOran, NumY,NumX )
%GETCESSBOARD Summary of this function goes here
%   Detailed explanation goes here
%CessYD=3.2; %CessBoard Y D�zlem Uzunlugu 
CessXD=CessYD*XYOran; %CessBoard X D�zlem Uzunlugu 
% NumY=6;
% NumX=8;
CessXd=CessXD/NumX; %cm boyutunda X d�zleminde bir kare uzunlu?u  (a)
CessYd=CessYD/NumY; %cm boyutunda Y d�zleminde bir kare uzunlu?u  (b)
% CessBoard k�se(nokta) degerlerini hesapla
for i=1:NumY
    for ii=1:NumX
      indx=(ii-1)*NumY+i;
      X(indx)=(ii-1)*CessXd-CessXD/2.0;
      Y(indx)=(i-1)*CessYd-CessXD/2.0;
      Z(indx)=0;
    end
end
PCess=[X;Y;Z];
end

