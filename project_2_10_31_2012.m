clear, clc
% Jeffery Schons and Kevin Dale project 2
tic
tatm=300;
h=0.005;
x=0:h:5;
num=5/h;
t(1)=4000;
t(num+1)=600;
w=1.1;
c=10^-8;

for j=2:num;
    t(j)=0;
end

%2nd method

for l=1:400000;
    for n=2:num;
     t(n)=0.5*(t(n+1)+t(n-1));
    end 

end
figure(1)
plot(x,t)
axis([0 5 0 4000]) 

for k=1:250000;
    for i=2:num;
     tnew=.5*(t(i+1)+t(i-1))-(1.0*(10^-8))*(h^2)*((t(i)-300)^4);
     t(i)=w*tnew+(1-w)*t(i);
    end
end
figure(2)
plot(x,t)
axis([0 5 0 4000])

%1st problem

for l=1:400000;
   for n=2:num;
     t(n)=0.5*(t(n+1)+t(n-1));
   end 
end
figure(3)
plot(x,t)
axis([0 5 0 4000])

for k=1:45000;
    for n=2:num;
     t(n)=0.5*(t(n+1)+t(n-1))-c*(h^2)*((t(n)-300)^4);
    end
end
toc
figure(4)
plot(x,t)
axis([0 5 0 4000])