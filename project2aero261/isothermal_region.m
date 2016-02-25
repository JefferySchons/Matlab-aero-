function [P,D] = isothermal_region(Pcal,Dcal,go,Tcal,R,h,h1)
    %calculates presure and density in isobaric region
    P=Pcal*(exp(1)^((-go/(Tcal*R))*(h-h1)));
    D=Dcal*(exp(1)^((-go/(Tcal*R))*(h-h1)));
end