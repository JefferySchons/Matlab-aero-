clear, clc
% Jeffery Schons and Kevin Dale Lab 9 Problem 1

%sol=roots([-0.12,12,-380,4100,220]);
for t=1:70
    h(t)=-0.12*(t^4)+12*(t^3)-380*(t^2)+(4100*t)+220;
    plot(t,h)
end
disp(h)
%figure(1)

%disp(sol)