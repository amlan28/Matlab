%name-amlan nayak
% reg no.-19BCD7143
% Dual Simplex
%problem-9
clc
clear all
Variables={'X','Y','S1','S2','Xb'};
NoofVar=2;
Cost=[12 20 0 0 0];
Costd=Cost.*(-1);
A=[6 8;7 12];
Ad=A.*(-1);
B=[100;120];
Bd=B.*(-1);
s=eye(size(Ad,1));
X=[Ad s Bd];
BV=NoofVar+1:1:size(X,2)-1;
zjCj=Costd(BV)*X-Costd;
zcj=[zjCj;X];
SimTable=array2table(zcj);
SimTable.Properties.VariableNames(1:size(zcj,2))=Variables;RUN=true;
while RUN
Sol=X(:,end);
if any(Sol<0)
fprintf('Current solution is not feasible\n')
[leaVar,pvtRow]=min(Sol);
fprintf('Leaving row = %d \n',pvtRow)
Row=X(pvtRow,1:end-1);
zj=zjCj(:,1:end-1);
for i=1:size(Row,2)
if Row(i)<0
ratio(i)=abs(zj(i)./Row(i));
else
ratio(i)=inf;
end
end
[minval,pivCol]=min(ratio);
fprintf('Entering variable = %d \n',pivCol)
BV(pvtRow)=pivCol;
fprintf('Basic Variables(BV) =')
disp(Variables(BV))
pvtkey=X(pvtRow,pivCol);
X(pvtRow,:)=X(pvtRow,:)./pvtkey;
for i=1:size(X,1)
if i~=pvtRow X(i,:)=X(i,:)-X(i,pivCol).*X(pvtRow,:);
end
end
zjCj=Costd(BV)*X-Costd;
zcj=[zjCj;X];
SimTable=array2table(zcj);
SimTable.Properties.VariableNames(1:size(zcj,2))=Variables;
else
RUN=false;
fprintf('Current Basic feasible sol is feasible and optimal \n')
end
FinalBFS=zeros(1,size(X,2));
FinalBFS(BV)=X(:,end);
FinalBFS(end)=sum(FinalBFS.*Costd);
OptimalBFS=array2table(FinalBFS);
OptimalBFS.Properties.VariableNames(1:size(OptimalBFS,2))=Variables;
end

Minz=FinalBFS(end)*(-1);
fprintf('Minz=');

disp(Minz)

  
  
#ans=205
