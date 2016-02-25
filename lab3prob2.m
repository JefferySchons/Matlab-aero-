clear, clc
% Jeffery Schons and Kevin Dale Lab 3 prob 2 Sept 12
A=input('enter coordinates of vertex A in form [x_a,y_a]');
B=input('enter coordinates of vertex B in form [x_b,y_b]');
C=input('enter coordinates of vertex C in form [x_c,y_c]');
%side of triangle
AB=side(A,B);
BC=side(B,C);
AC=side(A,C);
%area of triangle
AreaTR=area_tr(A,B,C);
fprintf('side of AB: %g',AB)
fprintf('side of AB: %g',BC)
fprintf('side of AB: %g',AC)
fprintf('area of triangle is: %g',AreaTR)