#                                                                                            Min. C=3x + y
#                                                                                            Sub. to Con.
#                                                                                            10x + 2y>=84
#                                                                                            8x + 4y>=120
#                                                                                             x>=0,y>=0
#name-Amlan Nayak    
#reg. no.-19BCD7143                 
#Linprog
#Problem-2

f=-[3 1];
A=[10 2;8 4];
b=[84;120];
lb=[0;0];
ub=[inf;inf];
[x,z]=linprog(f,A,b,[],[],lb,ub);
disp(x)
disp(-z)
  
  
#Ans= i)4.0000  22.0000 
  #ii)34
