function [ PCess ] = GetCessBoard( CessYD, XYOran, NumY,NumX )
%GETCESSBOARD Summary of this function goes here
%   Detailed explanation goes here
%CessYD=3.2; %CessBoard Y Düzlem Uzunlugu 
CessXD=CessYD*XYOran; %CessBoard X Düzlem Uzunlugu 
% NumY=6;
% NumX=8;
CessXd=CessXD/NumX; %cm boyutunda X düzleminde bir kare uzunlu?u  (a)
CessYd=CessYD/NumY; %cm boyutunda Y düzleminde bir kare uzunlu?u  (b)
% CessBoard köse(nokta) degerlerini hesapla
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

