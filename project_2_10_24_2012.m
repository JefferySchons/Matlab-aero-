clear, clc
% Jeffery Schons and Kevin Dale 
%h=0.001;
%x0=2;
%xf=x0+h;
%xb=x0-h;
%derif=((xf^3.0)-(x0^3.0))/h;
%derib=((x0^3.0)-(xb^3.0))/h;
%j is where the above 2 reach after high h
%j=(derif-derib)/h;
%t1=4000;
%t6=600;
%t2=0;
%t3=0;
%t4=0;
%t5=0;
%for i=1:5
%t2=.5*(t1+t3)-(1.0*(10^-8))*(h^2)*((t2-300)^4);
%t3=.5*(t2+t4)-(1.0*(10^-8))*(h^2)*((t3-300)^4);
%t4=.5*(t3+t5)-(1.0*(10^-8))*(h^2)*((t4-300)^4);
%t5=.5*(t4+t6)-(1.0*(10^-8))*(h^2)*((t5-300)^4);
%end
%disp(t2)
%disp(t3)
%disp(t4)
h=0.005;
x=0:h:5;
t(1)=4000;
t((5/h)+1)=600;
for k=1
    for i=2:5/h
        t(i)=0;
    end
end
%for k=1:100;
 %   for i=2:5/h;
  %   t(i)=.5*(t(i+1)+t(i-1))-(1.0*(10^-8))*h*h*((t(i)-300)^4);
   % end
%end
tatm=300
%h=0.05;
%t=10^-8*h^2(t(i)-tatm)^4;
%for x=0:h:5
%plot(x,t(i))
%end
num=5/h
t(1)=4000
t(num+1)=600
for n=2:num
    t(n)=0
end

for x=0:h:5
    plot(x,t(i));
for l=1:100
    for n=2:num;
    t(n)=0.5*(t(n+1)+t(n-1));
    end 
end
end

figure(1)
plot(x,t)
axis([0 5 0 4000])
