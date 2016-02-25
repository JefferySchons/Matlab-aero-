clear, clc
% Jeffery Schons and Kevin Dale Lab 9 Problem 1
g=9.8;
c=14;
t=7;

m=(1:200);
v=((g*m)./c).*(1-(exp(-(c./m).*t)));
plot (m,v)

v=35;

sol=fzero(@(m) ((g*m)/c)*(1-(exp(-(c/m)*t)))-v,60);
disp(sol)