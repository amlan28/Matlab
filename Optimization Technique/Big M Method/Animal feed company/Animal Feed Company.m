%name-Amlan Nayak
%reg. no.-19BCD7143
%Big M
%Problem-6


clc
clear all
V={'x1','x2','s2','s3','A1','A3','sol'};
M=1000;
C = [-3 -5 0 0 -M -M 0];
con=[1 1 0 0 1 0 ;1 0 1 0 0 0;0 1 0 -1 0 1 ];
B=[200;80;60];
A=[con B];
s=eye(size(A,1));
[m,n]=size(A);
% Finding strating BFS
BV=[];
for j=1:size(s,2)
for i=1:size(A,2)
if A(:,i)==s(:,j)
BV=[BV i];
end
end
end
ZjCj=C(BV)*A-C;
ZCj=[ZjCj;A];
BigM= array2table(ZCj);
BigM.Properties.VariableNames(1:size(ZCj,2))=V

m=true;
while m
%finding entering variable
ZC=ZjCj(:,1:end-1);
if any(ZC<0)
fprintf('The current Basic Feasible solution is not optimal\n');
[Entval,pvt_col]=min(ZC);
fprintf('Entering Column = %d\n',pvt_col);
Xb=A(:,end);
Column=A(:,pvt_col);
if all(Column<=0)
fprintf('UNBOUNDED! ');
else
for i=1:size(Column,1)
if Column(i)>0
ratio(i)=Xb(i)./Column(i);

else ratio(i)=inf;
end
end
[minR,pvt_row]=min(ratio);
fprintf('Leaving Row = %d\n', pvt_row);
%update the BV and Table
end
BV(pvt_row)=pvt_col;
B=A(:,BV);
A=inv(B)*A;
ZjCj=C(BV)*A-C;
ZCj=[ZjCj;A];
BigM=array2table(ZCj);
BigM.Properties.VariableNames(1:size(ZCj,2))=V
else
m=false;
fprintf('The Optimal solution is reached ');
Final_BFS = zeros(1,size(A,2));
Final_BFS(BV) =A(:,end);
Final_BFS(end)=sum(Final_BFS.*C);
OptimalBFS=array2table(Final_BFS);
OptimalBFS.Properties.VariableNames(1:size(OptimalBFS,2))=V
end
end


#ans=-840
