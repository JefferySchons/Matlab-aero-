clear, clc
% Jeffery Schons and Kevin Dale Lab 1 prob 3 Aug 29
y=input('input y: ');
x=input('input x: ');
if x<0 && y<0
    a=(x^2)+(y^2);
elseif x<0 && y>=0
    a=(x^2)+y;
elseif y<0 && x>=0
    a=(y^2)+x;
else
    a=x+y;
end
disp('answer is')
disp(a)