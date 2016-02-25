clear, clc
% Jeffery Schons project 1 aero 261

tic

%h at sl in km
hsl=0;
%tempiture at sl in K
Tsl=288.16;
%presure at sl in N/m^2
Psl=1.01325*(10^5);
%density at sl in Kg/m^3
Dsl=1.225;
%gravity at sl in m/s^2
go=9.80665;
%in J/(kg*K)
R=287;
%lapse Rate in K/m
a=-6.5*(10^(-3));
%radius of earth in km
Re=6371.0008*1000;

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
    hpotential(i)=h;
    [hightHg(i)]= geopoterntial_to_geometric(h,Re);
    if hight<=11
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
    [theta(i),sigma(i),delta(i)]= ratios(Tsl,Psl,Dsl,Temp(i),Dens(i),Pres(i));
end

Table=[hpotential; hightHg; Temp; Pres; Dens; theta; sigma; delta];
disp('note: sl is short for sea level')
disp('geopotential altitude(m) geometric altitude(m) Temperature(k) pressure(N/m^2) Density(kg/m^3) temp/temp_sl density/density_sl pressure/pressure_sl')
fprintf('\n')
fprintf('\t%5.0f \t\t\t\t\t%7.2f \t\t\t%7.2f \t\t%7.2f \t\t%7.2f \t\t\t%4.3f \t\t%4.3f \t\t\t%4.3f \n',Table)

figure(1)
plot(Temp, hpotential)
title('Plot of geopotential vs Tempiture')
xlabel('Tempiture')
ylabel('geopotential altitude')

figure(2)
plot(Dens, hpotential)
title('Plot of geopotential vs Density')
xlabel('Density')
ylabel('geopotential altitude')

figure(3)
plot(Pres, hpotential)
title('Plot of geopotential vs Pressure')
xlabel('Pressure')
ylabel('geopotential altitude')

figure(4)
plot(theta, hpotential)
title('Plot of geopotential vs Theta (Tempiture/Tsl)')
xlabel('Theta')
ylabel('geopotential altitude')

figure(5)
plot(sigma, hpotential)
title('Plot of geopotential vs Sigma (Pressure/Psl)')
xlabel('Sigma')
ylabel('geopotential altitude')

figure(6)
plot(delta, hpotential)
title('Plot of geopotential vs Delta (Density/Dsl)')
xlabel('Delta')
ylabel('geopotential altitude')

toc