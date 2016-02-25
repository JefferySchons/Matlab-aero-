function [u] = dynamic_viscosity(C1,C2,T)
    %calculates Reymonds number
    u=C1*((T.^(3/2))./(T+C2));
end