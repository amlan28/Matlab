%name-Amlan Shivam Nayak
%Reg no.-19BCD7143
close all;
clear all;
clc
tic
A=[21 16 25 43; 25 18 14 53; 32 27 18 41];
supply=[11 13 19];
demand=[6 10 12 15];
y=0;
while (~isempty(supply) && ~isempty(demand))

 M=min(A);
 N=min(M);
 i=0;
 j=0;
 [i,j]=find(A==N);
 X = min(supply(i(1)), demand(j(1)));
 y=y+X*N;
 if(X==supply(i(1)))
 A(i(1),:)=[];
 supply(i(1)) = [];
 demand(j(1))=demand(j(1))-X;
 end
 if(X==demand(j(1)))
 A(:,j(1))=[];
 demand(j(1)) = [];
 supply(i(1))=supply(i(1))-X;
 end
end
disp('The minimum transportation cost is:')
   
disp(y)

toc
tic

#ans=1117
#minimum is 6(calculate)
