clear, clc
% Jeffery Schons project 2 aero 261
tic

%read in the geometric altiture, velocity and time
table=dlmread('ReentryInput.txt',' ');
hg=table(:,1);
Vtable=table(:,2);
time=table(:,3);
numbofelements=length(table);

constants=dlmread('constants.txt',',');
costanttable=constants(:,1);
%T=tempiture
Tsl=costanttable(1);
%Tsl=288.16;
%D=density
Dsl=costanttable(2);
%Dsl=1.225;
%P=presure
Psl=costanttable(3);
%Psl=1.01325*10^5;
go=costanttable(4);
%go=9.80665;
%Length of
L=costanttable(5);
%L=56.05;
%C1,C2=constants that depend on the gas
C1=constants(6);
%C1=1.456*(10^(-6));
C2=costanttable(7);
%C2=110.3;
%Y= ratio of specific heats of the gas
Y=costanttable(8);
%Y=1.4;
%Specific gas constant of air
RG=costanttable(9);
%RG=287;
%radius of earth in m
Re=costanttable(10);
%Re=6371.0008*1000;

%u= dynamic viscosity of a fluid
%M= Mach number
%a=speed of sound for an ideal gas

for i=1:numbofelements
    hgi=hg(i);
    [h]= geometric_to_geopoterntial(hgi,Re);
    V=Vtable(i);
    T1=Tsl;
    D1=Dsl;
    P1=Psl;
    if h<11000
      [T,D,P] = gradient_region(T1,-6.5*(10^(-3)),h,D1,go,RG,P1);
       Temp(i)=T;
       Pres(i)=P;
       Dens(i)=D; 
       [a] = speed_of_sound(Y,RG,T);
       [M] = Mach_number(V,a);
       Mach(i)=M;
       [u] = dynamic_viscosity(C1,C2,T);
       [Re] = Reymonds_number(D,V,L,u);
       Reymonds(i)=Re;
    else
        [T,D,P] = gradient_region(T1,-6.5*(10^(-3)),11000,D1,go,RG,P1);
        T1=T;
        P1=P;
        D1=D;    
        if h<25000
            [P,D] = isothermal_region(P1,D1,go,T1,RG,h,11000);
            Temp(i)=T;
            Pres(i)=P;
            Dens(i)=D;
            [a] = speed_of_sound(Y,RG,T);
            [M] = Mach_number(V,a);
            Mach(i)=M;
            [u] = dynamic_viscosity(C1,C2,T);
            [Re] = Reymonds_number(D,V,L,u);
            Reymonds(i)=Re;
        else
            T1=T;
            P1=P;
            D1=D;   
        end
    end
end

Table=[time; hg; Vtable; a; M; u; Re];
disp('time(s) geometric altitude(m) Velocity(m/s) speed of sound(m/s) mach number dynamic viscosity Reymonds_number')
fprintf('\n')
fprintf('\t%5.0f \t\t\t\t\t%7.2f \t\t\t%7.2f \t\t%7.2f \t\t%7.2f \t\t\t%4.3f \t\t%4.3f \n',Table)
fprintf('\n')

figure(1)
plot(Reymonds, hg)
title('Plot of geometric vs Reymonds_number')
xlabel('Reymonds_number')
ylabel('geometric altitude')

figure(2)
plot(Mach, hg)
title('Plot of geometric vs Mach number')
xlabel('Mach number')
ylabel('geometric altitude')

toc