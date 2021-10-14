%Name-Amlan Shivam Nayak
%Reg no.-19BCD7143
clear
tic
c=[13 16 19 17
 17 19 16 25
 25 27 17 16];
[m,n]=size(c);
s=[250
 200
 250];
d=[100 250 250 100];
r=0.01;% Extra value for adding element in corrective degeneracy method
nvar = m+n-1;
x=zeros(m+1,n+1);
s1=zeros(m,1);
d1=zeros(1,n);
% Sum of demand and supply
 sumd=0;
sumd1=0;
 for j=1:n

 sumd=sumd+d(j);
 d1(j)=d(j);
 sumd1=sumd1+d1(j);
 end
sums=0;
sums1=0;
for i=1:m
 sums=sums+s(i);
 s1(i)=s(i);
 sums1=sums1+s1(i);
end
 % Balance supply and demand
 if sums~=sumd
 disp('Review amount of supply and demand');
 return
 end



for j=1:n
 while d1(j)>0
  for i=1:m
   if s1(i)>0 && d1(j)>0
     iall=i;
     jall=j;
 break
 end
 end
 if d1(jall)>s1(iall)
 d1(jall)=d1(jall)-s1(iall);
 x(iall,jall)=s1(iall);
 s1(iall)=0;
 elseif d1(jall)<s1(iall)
 s1(iall)=s1(iall)-d1(jall);
 x(iall,jall)=d1(jall);
 d1(jall)=0;
 elseif d1(jall)==s1(iall)
 x(iall,jall)=d1(jall);
 d1(jall)=0;
 s1(iall)=0;

 end
 end
end

 disp('Occupied matrix of NWC');

disp(x);

ZNWC=0;
 for i=1:m
 for j=1:n
 if x(i,j)>0
 ZNWC=ZNWC+x(i,j)*c(i,j);
 end
 end
 end
 countnwc=0;
for i=1:m
 for j=1:n
 if x(i,j)>0
 countnwc=countnwc+1;
 end
 end
 
 end
 % Check degeneracy solution
reducetant=m+n-1;
if countnwc>=reducetant
 disp('Non-degeneracy problem');
 disp('Total cost ');
 disp(ZNWC);
 degen=0;
else
 disp('The degeneracy NWC');
 disp('Total cost');
 disp(ZNWC);
 degen=1;


end

toc
tic
if degen==1
% How to correct degeneracy problem
 numdegen=reducetant-countnwc;
 iterationDegen=0;
for A=1:numdegen
 iterationDegen=iterationDegen+1;
 % Count the number of the basic cell on each row and column


 for j=1:n
 countcol=0;
 for i=1:m
 if x(i,j)>0
 countcol=countcol+1;
 end
 end
 x(m+1,j)=countcol;
 end
 for i=1:m
 countrow=0;
 for j=1:n
 if x(i,j)>0
 countrow=countrow+1;
 end
 end
 x(i,n+1)=countrow;
 end
% Assign adding one on the entering cell
 for j=1:n-1
 if x(m+1,j)==1
 jenter=j;
 for i=1:m-1
 if x(i,n+1)==1
 ienter=i;
 break
 end
 end
 end
 end
 if x(ienter,jenter)== 0
 x(ienter,jenter)=r;
 break
 end
end
% Add demand and supply with r
 for j=1:n
 for i=1:m
 if x(i,j)==r
 d(j)=d(j)+r;
 end
 end
 end
 for i=1:m
 for j=1:n
 if x(i,j)==r
 s(i)=s(i)+r;
 end
 end
 end
end
 %% The degeneracy
 countxdegen=0;


 for i=1:m
 for j=1:n
 if x(i,j)>0
 countxdegen=countxdegen+1;

 end
 end
 end


 if countxdegen>=reducetant;

 else
 disp('Do not correct Degeneracy VAM');
% return

 end
 
 
 #ans=11350
 #errors may occur.check indents of 'for' and 'while' loops(give req. spaces)
