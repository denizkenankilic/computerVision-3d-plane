function [ Plane ] = GetPlane( P1, P2, P3)
%GETPLANE Summary of this function goes here
%   Detailed explanation goes here

P12=P2-P1; % P12 == u
P13=P3-P1; % P13 == v; u ve v düzleme vectorlerdir paralel dir.

% u X v cross product2ý kullanarak düzlemin normal vektörünü bul 
%         | i        j        k     |    | p12(2)  p12(3)|     |   |    | |
% u X v = | p12(1)  p12(2)   p12(3) | = i|               | + j |   | + k| |
%         | p13(1)  p13(2)   p13(3) |    | p13(2)  p13(3)|     |   |    | |
%  
% == i (  P12(2)*P13(3) - P12(3)*P13(2)) + 
%    j (  P12(1)*P13(3) - P12(3)*P12(1)) +
%    k (  P12(1)*P13(2) - P12(2)*P13(1))

a = P12(2)*P13(3) - P12(3)*P13(2);
b = -(P12(1)*P13(3) - P12(3)*P13(1));
c = P12(1)*P13(2) - P12(2)*P13(1);

% NV=[a b c];
A=a;
B=b;
C=c;
D=-(a*P2(1)+b*P2(2)+c*P2(3));

Plane=[A B C D];
%    Dogrulama   
% p1=[P1 1] ;
% p2=[P2 1] ;
% p3=[P3 1] ;
% 
% T1=Plane*p1 ;
% T2=Plane*p2 ; 
% T3=Plane*p3 ;
end

