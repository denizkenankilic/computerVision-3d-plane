function [ B ] = GetB( Z0,ACD )
%GETB Summary of this function goes here
%   Detailed explanation goes here

Z10=Z0(1);
Z20=Z0(2);
Z30=Z0(3);

B1=TestErr1( Z10,Z20,Z30,ACD );
B2=TestErr2( Z10,Z20,Z30,ACD );
B3=TestErr3( Z10,Z20,Z30,ACD );

B=[ B1 B2 B3]';

end

