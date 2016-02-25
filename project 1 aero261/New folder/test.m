clear, clc
% Jeffery Schons project 1 aero 261
 
startheight=input('initial hight for data in km in geopotential (0 is sea level)');
finalheight=input('final hight for data in km (max 15km) in geopotential');
R=63;
D1=5;
g=9.8;
P1=1.02;
a=2.67;
T1=286;
for h=startheight:finalheight;
    gra = gradient_region(T1,a,h,D1,g,R,P1);
    j(h)=T;
    q(h)=D;
    l(h)=P;
end
disp(j)
disp(q)
disp(l)


