clear, clc
% Jeffery Schons and Kevin Dale 
pi=4*atan(1.0);
theta_deg=input('input angle of chord');
%y=input('input distance chord tip from chord root');
%aspect ratio
Aratio=7.3;
%s=wing area
s=40;
%t is tao
t=.6;
%b=wing span
b=(Aratio*s)^(1/2);
%C is the chord length
Croot=(2*s)/(b*(1+t));
Ctip=(2*s*t)/(b*(1+t));
%degrees to rad
theta_rad=theta_deg*pi/180;
%chord at y
Cy=0.5*b*cos(theta_rad);

fprintf('Aspect Ratio: %g \n',Aratio)
fprintf('Wing Area: %g \n',s)
fprintf('tao: %g \n',t)
fprintf('Wing Span: %g \n',b)
fprintf('Chord Root: %g \n',Croot)
fprintf('Chord Tip: %g \n',Ctip)
fprintf('Chord at y: %g \n',Cy)
fprintf('pi: %g \n',pi)

for i=1:3
    a0= 2*pi;
    alpha_bar=(5*pi)/180;
    alpha0=-(2*pi)/180;
    theta_deg=22.5*i;
    theta_rad=theta_deg*pi/180; 
    P1=sin(theta_rad)+((a0*Cy)/(4*b));
    P2=sin(3*theta_rad)+(((a0*Cy)/(4*b))*((3*sin(3*theta_rad))/(sin(theta_rad))));
    P3=sin(5*theta_rad)+(((a0*Cy)/(4*b))*((5*sin(5*theta_rad))/(sin(theta_rad))));
    Q=((a0*Cy)/(4*b))*(alpha_bar-alpha0);
    M[i,1]=P1;
    M[i,2]=P2;
    M[i,3]=P3;
    b(i)=Q;
end
