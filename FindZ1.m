function [ ZNew] = FindZ1( ACD,kont,Carp, Count, Depth, Esik1,Esik2,Esik3 )
%FÝNDZ1 Summary of this function goes here
%   Detailed explanation goes here

% Z1=1+i*0.001; i=1:10000 için Z1'i ata ve  Potansiyel do?ru olan atamalar? çöz 
Z1a=0;
indx=1;
for i=1:Count
    Z1=1+i*Depth/Count;
[ZS1]=QuadrantCalculate(Z1,ACD );
Ez1=abs(Z1-ZS1);
for ii=1:8
    if (Ez1(ii) < Esik1)
        Z1M(indx)=Z1; Ee(indx)=Ez1(ii);
    %    ia(indx)=i  ; iaa(indx)=ii;
        indx=indx+1;
    end
end
end
%  S?n?r De?er üzerinden Ortaya ç?kan Potansiyel Z1 leri s?rala ve tasnif ederek 
%  yak?n deðerleri ç?kar  
Z1M1=bubblesort([Z1M;Ee]);
Zz=Z1M1(1,:);
ia=size(Zz');
ia=ia(1);
ZNInd=1;
ZNew(ZNInd)=Zz(1);
Zer=abs(Zz(1)-Zz);
Zza=0;


while (ia > 1)
index=1;
for i=1:ia
    if (Zer(i) > Esik2)
    Zza(index)=Zz(i);
    index=index+1;
    end
end
ia=size(Zza');
ia=ia(1);
if(ia > 1)
    ZNInd=ZNInd+1;
    Zz=Zza; 
    ZNew(ZNInd)=Zz(1);
    Zer=abs(Zz(1)-Zz);
    Zza=0;
end    
end

%ZNew
% Z1 leri test et ve Z2 ve Z3 degerlerini bul
iz=size(ZNew');
iz=iz(1);
indx=1;
for i=1:iz
 Zz1(i,:)=QuadrantCalculateA(ZNew(i),ACD,Carp,Esik3 );
 if((Zz1(i,2) > 0) & (Zz1(i,3) > 0)) 
     ZNewA(indx,:)=Zz1(i,:);
     indx=indx+1;
 end
end
ZNew=ZNewA;
 end


