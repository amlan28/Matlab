% name-amlna nayak
% reg. no -19bcd7143
% date-9/8/19
syms x y
 f=sin(pi*x)+sin(pi*y)
 u=diff(f,x)
 v=diff(u,x)
 w=diff(f,y)
 x=diff(w,y)
 v+x
