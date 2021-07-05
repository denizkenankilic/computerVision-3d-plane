function [ZS1] = QuadrantCalculateA(Z1,ACD,W,Esik3 )
%QUADRANTCALCULATE Summary of this function goes here
%   Detailed explanation goes here

a1=ACD(1);a2=ACD(2);a3=ACD(3);c1=ACD(4);c2=ACD(5);c3=ACD(6);
d1=ACD(7);d2=ACD(8);d3=ACD(9);

Z21=0; Z22=0; Z311=0; Z321=0; Z312=0; Z322=0; Z11=0; Z12=0; Z13=0; Z14=0; Z15=0; Z16=0; Z17=0; Z18=0;

a=a2;
b=-c1*Z1;
c=a1*Z1^2-d1^2; 
Z2(1)=(-b-sqrt(b^2-4*a*c))/(2*a);
Z2(2)=(-b+sqrt(b^2-4*a*c))/(2*a);
e2(1)= sqrt(a1*Z1^2+a2*Z2(1)^2-c1*Z1*Z2(1))-d1;
e2(2)= sqrt(a1*Z1^2+a2*Z2(2)^2-c1*Z1*Z2(2))-d1;



a=a3;
b=-c3*Z2(1);
c=a2*Z2(1)^2-d3^2;
Z3(1)=(-b-sqrt(b^2-4*a*c))/(2*a);
Z3(2)=(-b+sqrt(b^2-4*a*c))/(2*a);
e3(1)= sqrt(a2*Z2(1)^2+a3*Z3(1)^2-c3*Z2(1)*Z3(1))-d3;
e3(2)= sqrt(a2*Z2(1)^2+a3*Z3(2)^2-c3*Z2(1)*Z3(2))-d3;


a=a3;
b=-c3*Z2(2);
c=a2*Z2(2)^2-d3^2;
Z3(3)=(-b-sqrt(b^2-4*a*c))/(2*a);
Z3(4)=(-b+sqrt(b^2-4*a*c))/(2*a);
e3(3)= sqrt(a2*Z2(2)^2+a3*Z3(3)^2-c3*Z2(2)*Z3(3))-d3;
e3(4)= sqrt(a2*Z2(2)^2+a3*Z3(4)^2-c3*Z2(2)*Z3(2))-d3;

%Zza=[Z2(1) Z2(2) Z3(1) Z3(2) Z3(3) Z3(4)];


a=a1;
b=-c2*Z3(1);
c=a3*Z3(1)^2-d2^2;
Z11(1)=(-b-sqrt(b^2-4*a*c))/(2*a);
Z11(2)=(-b+sqrt(b^2-4*a*c))/(2*a);
e11(1)= sqrt(a1*Z11(1)^2+a3*Z3(1)^2-c2*Z11(1)*Z3(1))-d2;
e11(2)= sqrt(a1*Z11(2)^2+a3*Z3(1)^2-c2*Z11(2)*Z3(1))-d2;


a=a1;
b=-c2*Z3(2);
c=a3*Z3(2)^2-d2^2;
Z11(3)=(-b-sqrt(b^2-4*a*c))/(2*a);
Z11(4)=(-b+sqrt(b^2-4*a*c))/(2*a);
e11(3)= sqrt(a1*Z11(3)^2+a3*Z3(2)^2-c2*Z11(3)*Z3(2))-d2;
e11(4)= sqrt(a1*Z11(4)^2+a3*Z3(2)^2-c2*Z11(4)*Z3(2))-d2;


a=a1;
b=-c2*Z3(3);
c=a3*Z3(3)^2-d2^2;
Z11(5)=(-b-sqrt(b^2-4*a*c))/(2*a);
Z11(6)=(-b+sqrt(b^2-4*a*c))/(2*a);
e11(5)= sqrt(a1*Z11(5)^2+a3*Z3(3)^2-c2*Z11(5)*Z3(3))-d2;
e11(6)= sqrt(a1*Z11(6)^2+a3*Z3(3)^2-c2*Z11(6)*Z3(3))-d2;


a=a1;
b=-c2*Z3(4);
c=a3*Z3(4)^2-d2^2;
Z11(7)=(-b-sqrt(b^2-4*a*c))/(2*a);
Z11(8)=(-b+sqrt(b^2-4*a*c))/(2*a);
e11(7)= sqrt(a1*Z11(7)^2+a3*Z3(4)^2-c2*Z11(7)*Z3(4))-d2;
e11(8)= sqrt(a1*Z11(8)^2+a3*Z3(4)^2-c2*Z11(8)*Z3(4))-d2;


%ZS1=[Z11(1) Z11(2) Z11(3) Z11(4) Z11(5) Z11(6) Z11(7) Z11(8)]
index = 0;
Z2s=0;
Z3s=0;
for i=1:8
    if abs(Z11(i)-Z1) < Esik3
        index=i; 
        e=abs(Z11(i)-Z1);
    end
end


while (index > 0)

 if index==1 
    Z3s=Z3(1);Z2s=Z2(1);
 end
 if index==2
    Z3s=Z3(1);Z2s=Z2(1);
 end
 
 if index==3 
   Z3s=Z3(2);Z2s=Z2(1);
 end
 
 if index==4
     Z3s=Z3(2);Z2s=Z2(1);
 end
 
 if index==5 
     Z3s=Z3(3); Z2s=Z2(2);
 end
 
  if index==6
     Z3s=Z3(3); Z2s=Z2(2);
  end
      
 if index==7 
     Z3s=Z3(4); Z2s=Z2(2);
 end
 
  if index==8
     Z3s=Z3(4); Z2s=Z2(2);
  end
  index =0;
end
 
 ZS1=[Z1 Z2s Z3s e*W];
  
  
  
end

