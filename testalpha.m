clear, clc
% Jeffery Schons and Kevin Dale 
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

for l=1:400000;
   for n=2:num;
     t(n)=0.5*(t(n+1)+t(n-1));
   end 
end
figure(3)
plot(x,t)
axis([0 5 0 4000])

%for k=1:45000;
   % for n=2:num;
    % t(n)=0.5*(t(n+1)+t(n-1))-c*(h^2)*((t(n)-300)^4);
   % end
%end
%toc
%figure(4)
%plot(x,t)
%axis([0 5 0 4000])