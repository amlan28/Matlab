#name-Amlan Nayak
#reg. no.-19BCD7143

#Maximize: P = 7 T + 5 C
#Subject to (constraints)
#Carpentry restriction: 4 T + 3 C ≤ 240
#Painting restriction: 2 T + C ≤ 100
#Inventory condition: C ≤ 60
#Non-negativity condition:
#T≥ 0, C≥0

f=-[7 5];
A=[4 3;2 1];
b=[240;100];
lb=[0;0];
ub=[inf;60];
[x]=linprog(f,A,b,[],[],lb,ub)
[x,z]=linprog(f,A,b,[],[],lb,ub);
disp(-z)
  
#Ans=410  
