clear, clc
% Jeffery Schons and Kevin Dale 
speed=590;
density=0.002376;
%pi=4*atan(1.0);
%angle_of_chord=22.4;
%theta_deg=angle_of_chord;
%theta_deg=input('input angle of chord');
%y=input('input distance chord tip from chord root');
%aspect ratio
Aratio=7.67;
%s=wing area
s=527;
%t is tao
t=.6;
%b=wing span
b=(Aratio*s)^(1/2);
%degrees to rad
%theta_rad=theta_deg*pi/180;
alpha_bar=(5*pi)/180;
alpha0=-(2*pi)/180;
%fprintf('Aspect Ratio: %g \n',Aratio)
%fprintf('Wing Area: %g \n',s)
%fprintf('tao: %g \n',t)
%fprintf('Wing Span: %g \n',b)
%fprintf('Chord Root: %g \n',Croot)
%fprintf('Chord Tip: %g \n',Ctip)
%fprintf('Chord at y: %g \n',Cy)
%fprintf('pi: %g \n',pi)

for j=0:6
t=0.05+.15*j; 
Croot=(2*s)/(b*(1+t));
Ctip= (t * Croot);


%A1*P1+A2*P2+A3*P3=Q finding A1,A2,A3

for i=1:3
    theta_deg=22.5*i;
    theta_rad=theta_deg*pi/180; 
    
    y=.5*b*cos(theta_rad);
 
    Cy=(2*y*(Ctip-Croot))./(b)+Croot;
    
    P1=sin(theta_rad)+((2*pi*Cy)/(4*b));
    P3=sin(3*theta_rad)+(((2*pi*Cy)/(4*b))*((3*sin(3*theta_rad))/(sin(theta_rad))));
    P5=sin(5*theta_rad)+(((2*pi*Cy)/(4*b))*((5*sin(5*theta_rad))/(sin(theta_rad))));
    Q=(.25*2*pi*Cy)/(b)*(alpha_bar-alpha0);
    M(i,1)=P1;
    M(i,2)=P3;
    M(i,3)=P5;
    U(i)=Q;
end
A=M\U';

theta_deg_plot=linspace(0,90);
theta_rad_plot=theta_deg_plot*pi/180;

y=.5*b*cos(theta_rad_plot);
Croot=(2*s)/(b*(1+t));
Ctip=(t * Croot);
%chord at y
Cy=(2*y*(Ctip-Croot))./(b)+Croot;

%lift_coef=pi*Aratio*A(1,1);
%lift=0.5*density*speed*speed*s*lift_coef;
lift_force=A(1)*sin(theta_rad_plot)+A(2)*sin(3*theta_rad_plot)+A(3)*sin(5*theta_rad_plot);
lift_coef=(4*b*lift_force)./Cy;

%fprintf('lift: %g \n',lift_force)

figure (1)
plot(y,lift_force)
title ('semi-span location by lift force')
ylabel('lift force')
xlabel('semi-span location')
hold all
figure(2)
plot(y,lift_coef)
title ('semi-span location by lift coef')
ylabel('lift coef')
xlabel('semi-span location')
hold all
end
