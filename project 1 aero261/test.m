clear, clc
% Jeffery Schons project 1 aero 261

constants=dlmread('ReentryInput.txt',' ');
%T=tempiture
Tsl=constants(1,:)
%Tsl=288.16;
%D=density
Dsl=constants(2,:)
%Dsl=1.225;
%P=presure
Psl=constants(3,:)
%Psl=1.01325*10^5;
go=constants(4,:)
%go=9.80665;
%Length of
L=constants(5,:)
%L=56.05;
%C1,C2=constants that depend on the gas
C1=constants(6,:)
%C1=1.456*(10^(-6));
C2=constants(7,:)
%C2=110.3;
%Y= ratio of specific heats of the gas
Y=constants(8,:)
%Y=1.4;
%Specific gas constant of air
RG=constants(9,:)
%RG=287;