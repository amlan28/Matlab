f=-[84 120];
A=[10 8;2 4];
b=[3;1];
lb=[0;0];
ub=[inf;inf];
Aeq = [];
beq = [];
options = optimoptions('linprog','Algorithm','interior-point');
x = linprog(f,A,b,Aeq,beq,lb,ub,options)
[x,z] = linprog(f,A,b,Aeq,beq,lb,ub,options);
disp(-z)

  
  
#ans=34  
