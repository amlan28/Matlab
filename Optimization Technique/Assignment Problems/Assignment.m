%problem-13
% Assignment
clc;
clear all;
C=[13 8 16 18 19;9 15 24 9 12;12 9 4 4 4;6 12 10 8 13;15 17 18 12 20];
M = matchpairs(C,1000)
MinCost = sum(C(sub2ind(size(C), M(:,1), M(:,2))))
  
  
  
#ans=42  
