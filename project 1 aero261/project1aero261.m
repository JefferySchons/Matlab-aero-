clear, clc
% Jeffery Schons project 1 aero 261

tic

%add 3 functions(t/tsl) (dens/densSL) (presure/presureSL)

% have text doc with initial data (called 'aero261proj1intdata.txt') in form
% 'h at sl in km','tempiture at sl in K','presure at sl in N/m^2'
% 'density at sl in Kg/m^3','gravity at sl in m/s^2','R value in J/(kg*K)'
% 'lapse rate (a) in K/m','radius of earth in km','
%the aero261proj1intdata.txt should read
% 0,    288.16,   101325
% 1.225,9.80665,  287
%-.0065,6371.0008,


%height from 0 to 15km in 1km increments in geopotential

%h at sl in km
%hsl=dlmread('aero261proj1intdata.txt',',',[0,0,0,0]);
hsl=0;
%tempiture at sl in K
%Tsl=dlmread('aero261proj1intdata.txt',',',[0,1,0,1]);
Tsl=288.16;
%presure at sl in N/m^2
%Psl=dlmread('aero261proj1intdata.txt',',',[0,2,0,2]);
Psl=1.01325*(10^5);
%density at sl in Kg/m^3
%Dsl=dlmread('aero261proj1intdata.txt',',',[1,0,1,0]);
Dsl=1.225;
%gravity at sl in m/s^2
%go=dlmread('aero261proj1intdata.txt',',',[1,1,1,1]);
go=9.80665;
%in J/(kg*K)
%R=dlmread('aero261proj1intdata.txt',',',[1,2,1,2]);
R=287;
%lapse Rate in K/m
%a=dlmread('aero261proj1intdata.txt',',',[2,0,2,0]);
%a=-6.5*(10^(-3));
%radius of earth in km
%Re=dlmread('aero261proj1intdata.txt',',',[2,1,2,1]);
Re=6371.0008*1000;

%function [hg]= geopoterntial_to_geometric(h,Re);
    %%calculates geometric altitude from geopoterntial
    %hg=(h*Re)/(Re-h);
%end

%height from 0 to 15km in 1km increments in geopotential
%dlmread('aero261proj1intdata.txt',',',[R1,C1,R2,C2])
%[hg]= geopoterntial_to_geometric(h,Re)

startheight=input('initial hight for data in km in geopotential (0 is sea level)');
finalheight=input('final hight for data in km (max 15km) in geopotential');
Sh=startheight+1;
Fh=finalheight+1;
for i=Sh:Fh
    %i IS INDEX #
    h=(i-1)*1000;
    T1=Tsl;
    D1=Dsl;
    P1=Psl;
    hight=(i-1);
    hpotential(i)=hight;
    [hg]= geopoterntial_to_geometric(hight,Re);
    hightHg(i)=hg;
    if hight<=11
        a=-6.5*(10^(-3));
        [T,D,P] = gradient_region(T1,a,h,D1,go,R,P1);
        Temp(i)=T;
        Pres(i)=P;
        Dens(i)=D;
    else
        T1=T;
        P1=P;
        D1=D;
        if hight<=25
            [P,D] = isothermal_region(P1,D1,go,T1,R,h,11000);
            Temp(i)=T;
            Pres(i)=P;
            Dens(i)=D;
        else
            T1=T;
            P1=P;
            D1=D;
            if hight<=47
                a=3*(10^(-3));
                [T,D,P] = gradient_region(T1,a,h,D1,go,R,P1);
                Temp(i)=T;
                Pres(i)=P;
                Dens(i)=D;
            else
                T1=T;
                P1=P;
                D1=D;
                if hight<=53
                    [P,D] = isothermal_region(P1,D1,go,T1,R,h,47000);
                    Temp(i)=T;
                    Pres(i)=P;
                    Dens(i)=D;
                else
                    T1=T;
                    P1=P;
                    D1=D;
                    if hight<=79;
                        a=-4.5*(10^(-3));
                        [T,D,P] = gradient_region(T1,a,h,D1,go,R,P1);
                        Temp(i)=T;
                        Pres(i)=P;
                        Dens(i)=D;
                    else
                        T1=T;
                        P1=P;
                        D1=D;
                        if hight<=90
                            [P,D] = isothermal_region(P1,D1,go,T1,R,h,79000);
                            Temp(i)=T;
                            Pres(i)=P;
                            Dens(i)=D;
                        else
                            T1=T; 
                            P1=P;
                            D1=D;
                            if hight<=105
                                a=4*(10^(-3));
                                [T,D,P] = gradient_region(T1,a,h,D1,go,R,P1);
                                Temp(i)=T;
                                Pres(i)=P;
                                Dens(i)=D;
                            else
                                T1=T;
                                P1=P;
                                D1=D;
                            end
                        end
                    end
                end
            end
        end
    end
    [theta,sigma,delta]= ratios(Tsl,Psl,Dsl,T1,D1,P1);
     theta_vector(i)=theta;
     sigma_vector(i)=sigma;
     delta_vector(i)=delta;
end
Table=[hpotential; hightHg; Temp; Pres; Dens; theta_vector; sigma_vector; delta_vector];
disp('note: sl is short for sea level')
disp('geopotential altitude(m) geometric altitude(m) Temperature(k) pressure(N/m^2) Density(kg/m^3) temp/temp_sl density/density_sl pressure/pressure_sl')
fprintf('\n')
fprintf('\t%5.0f \t\t\t\t\t%7.2f \t\t\t%7.2f \t\t%7.2f \t\t%7.2f \t\t\t%4.3f \t\t%4.3f \t\t\t%4.3f \n',Table)

toc
figure(1)
plot(Dens, hpotential)
title('Plot of geopotential vs Tempiture')
xlabel('pres')
ylabel('geopotential altitude')

  %hpotential vs temperature
  %hpotential vs density
  %hpotential vs pressure
  %Tempiture in poterntial vs Tempiture at sea level
  %Pressure in poterntial vs Pressure at sea level
  %density in poterntial vs density at sea level
  %table with geopotential altitude (h), geometric altitude(hg), 
        %Tempiture, Pressure,density,T vs Tsl, p vs psl, D vs Dsl, 
        
%disp('hight potential');
%disp(hpotential);
%disp('hg');
%disp(hightHg);
%disp('Tempiture');
%disp(Temp);
%disp('Presure');
%disp(Pres);
%disp('Density');
%disp(Dens);
%disp('theta');
%disp(theta_vector);
%disp('sigma');
%disp(sigma_vector);
%disp('delta');
%disp(delta_vector);

%table=[hpotential;Temp];
%fprintf('geopotential hight %g is %g \n',table)
%fprintf('tempiture is %g %g \n',Temp)

%table2=[hpotential;hightHg];
%fprintf('geopotential hight to hg %g is %g \n',table2)



%table
%fprintf('standard Atmosphere'hpotential,hg,Temp,Pres,Dens,


