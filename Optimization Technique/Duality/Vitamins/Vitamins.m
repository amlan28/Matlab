f=-[40 50];
A=[2 4;3 2];
b=[3;2.5];
lb=[0;0];
ub=[inf;inf];
Aeq = [];
beq = [];
options = optimoptions('linprog','Algorithm','interior-point');
[x,z] = linprog(f,A,b,Aeq,beq,lb,ub,options);
disp('amounts of X and Y: ')
disp(x)
disp('min cost: ')
disp(-z)


#ans=i)0.5 0.5 ii)45    
