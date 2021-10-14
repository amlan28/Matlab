#name-amlan nayak
#reg no.-19BCD7143
#z=7x+4y
#subject to const:
#3x+2y<=12
#3x+y<=9
#x,y>=0


clc;
clear all;
Noofvariables=2;
C=[7 4]; %cost matrix in row
M=[3 2;3 1]; %coefficient m atrix
b=[12;9]; % right hand side matrix
s=eye(size(M,1));
A=[M s b];
[m,n]=size(A);
cost=zeros(1,n); % zero matrix
cost(1:Noofvariables)=C;
%return;
%%%Constraint BV (indices of BV)
BV=Noofvariables+1:1:n-1
%
% %% Calculate zj-cj row
zjcj=cost(BV)*A-cost;
% for print the table
zcj=[zjcj;A];
SimpleTable=array2table(zcj);
SimpleTable.Properties.VariableNames(1:size(zcj,2))={'x_1';'x_2';'s_1';'s_2';'sol'}

%%Simplex Table strating
RUN=true;
while RUN
if any(zjcj<0) %%check if any negative value there
fprintf('The current BFS is not optimal \n')
fprintf('\n The next iteration\n')
disp('Old Basic variable (BV)');
disp(BV);
%%find the entering variable
zc=zjcj(1:end-1);
[EnterCol,pvt_col]=min(zc);
fprintf('the most negative element in zj-cj row is %d corresponding column %d \n', EnterCol, pvt_col);
fprintf('Entering variable is %d \n', pvt_col);
%Finding the leaving variable
if all(A(:,pvt_col)<=0)
error('LPP is unbounded all enteries <= in column %d', pvt_col);

else
sol=A(:,end);
column=A(:,pvt_col);
for i=1:size(A,1)
if column(i)>0
ratio(i) =sol(i)./column(i);
else
ratio(i)=inf;
end
end
% finding minimum
[MinRatio,pvt_row]=min(ratio);
fprintf('Leaving variable is %d \n', BV(pvt_row));
end
%----------------------------------upto here-----------------------
BV(pvt_row)=pvt_col;
disp('New basic variable (BV)=');
disp(BV);
%pivot key
pvt_key=A(pvt_row,pvt_col);
%update the table for next iteration
A(pvt_row,:)=A(pvt_row,:)./pvt_key;
for i=1:size(A,1)
if i~=pvt_row
A(i,:)=A(i,:)-A(i,pvt_col).*A(pvt_row,:);
end
end
zjcj=zjcj-zjcj(pvt_col).*A(pvt_row,:);
%for printing purpose
zcj=[zjcj;A];
TABLE=array2table(zcj);
TABLE.Properties.VariableNames(1:size(zcj,2))={'x_1';'x_2';'s_1';'s_2';'sol'}
BFS=zeros(1,size(A,2));
BFS(BV)=A(:,end);
BFS(end)=sum(BFS.*cost);
Current_BFS=array2table(BFS);
Current_BFS.Properties.VariableNames(1:size(Current_BFS,2))={'x_1';'x_2';'s_1';'s_2';'sol'}
else
RUN=false;
fprintf('======********====== \n')
fprintf('The current BFS is optimal \n')
fprintf('======********====== \n')
end
end


#ans=26
