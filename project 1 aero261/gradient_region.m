function [T,D,P] = gradient_region(T1,a,h,D1,go,R,P1)
    %calculates tempiture, presure and density in gradiunt region
    T=T1+(a*h);
    D=D1*((T/T1)^((-go/(a*R)-1)));
    P=P1*((T/T1)^((-go/(a*R))));
end