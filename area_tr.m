function [a]=area_tr(A,B,C)
% Jeffery Schons and Kevin Dale Lab 3 prob 2 Sept 12
% find take off speed
a=(1/2)*abs((A(1)-C(1))*(B(2)-A(2))-(A(2)-B(1))*(C(2)-A(2)));