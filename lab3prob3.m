clear, clc
% Jeffery Schons and Kevin Dale Lab 3 prob 3 Sept 12

A=input('enter Matrix A');
[x,y]=max(A);
A_max=max(x);
al=A;
al(1,1)=A_max;

disp('matrix A is')
disp(A)
fprintf('the largest number A max in matrix A is=%g')
disp('the matrix al is')
disp(al)