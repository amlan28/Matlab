%name-Amlan Shivam Nayak
%Reg no.-19BCD7143
%Game Theory
% Problem-14
clc
clear all
a = [30,20;20,0];
disp(a);

maxi=max(a);
maximin=min(maxi);
b=transpose(a);
mini = min(b);
minimax = max(mini);
if(minimax==maximin)
 row = find(mini==minimax);
 col = find(maxi==maximin);
 disp('Saddle point exists');
 disp('The value of game for A is:');
 disp(row);
 disp('The value of game for B is:');
 disp(col);
 disp('The value of game is:');
 disp(minimax);
end



#ans=20
