#name-Amlan Nayak
#reg. no.-19BCD7143


f=-[7 5];
A=[4 3;2 1];
b=[240;100];
lb=[0;0];
ub=[inf;60];
[x]=linprog(f,A,b,[],[],lb,ub)
[x,z]=linprog(f,A,b,[],[],lb,ub);
disp(-z)
  
#Ans=410  
