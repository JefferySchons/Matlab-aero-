function [theta,sigma,delta]= ratios(Tsl,Psl,Dsl,T1,D1,P1)
    %calculates geometric altitude from geopoterntial
 theta=T1/Tsl;
 sigma=D1/Dsl;
 delta=P1/Psl;
end