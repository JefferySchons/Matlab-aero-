clear, clc
% Jeffery Schons and Kevin Dale 

Aratio=7.2;
%s=wing area
s=5;
%t is tao
t=5;
%b=wing span
b=(Aratio*s);
%C is the chord length
Croot=(2*s)/(b*(1+t));
Ctip=(2*s*t)/(b*(1+t));
fprintf('Aspect Ratio: %g \n',Aratio)
fprintf('Wing Area: %g \n',s)
fprintf('tao: %g \n',t)
fprintf('Chord Root: %g \n',Croot)
fprintf('Chord Tip: %g \n',Ctip)

