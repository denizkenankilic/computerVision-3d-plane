function [ A] = GetA( Z0,ACD,h )
%GETA Summary of this function goes here
%   Detailed explanation goes here

Z10=Z0(1);
Z20=Z0(2);
Z30=Z0(3);

A11=(TestErr1(Z10+h,Z20,Z30,ACD)-TestErr1(Z10-h,Z20,Z30,ACD))/(2*h);
A12=(TestErr1(Z10,Z20+h,Z30,ACD)-TestErr1(Z10,Z20-h,Z30,ACD))/(2*h);
A13=0;

A21=(TestErr2(Z10+h,Z20,Z30,ACD)-TestErr2(Z10-h,Z20,Z30,ACD))/(2*h);
A22=0;
A23=(TestErr2(Z10,Z20,Z30+h,ACD)-TestErr2(Z10,Z20,Z30-h,ACD))/(2*h);

A31=0;
A32=(TestErr3(Z10,Z20+h,Z30,ACD)-TestErr3(Z10,Z20-h,Z30,ACD))/(2*h);
A33=(TestErr3(Z10,Z20,Z30+h,ACD)-TestErr3(Z10,Z20,Z30-h,ACD))/(2*h);

A=[A11 A12 A13; A21 A22 A23; A31 A32 A33];
end

