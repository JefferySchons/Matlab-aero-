clear, clc
% Jeffery Schons and Kevin Dale Lab 3 prob 1 Sept 12
% find take off speed
Function:
Function [V]=speed_take_off(m)

g=-9.8;
Cl=2;
P=1;
S=4;
t=(2*M*g)/(Cl*P*S);
V=sqrt(t);


