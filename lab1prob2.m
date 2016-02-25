clear, clc
% Jeffery Schons and Kevin Dale Lab 1 prob 2 Aug 29
biggest=input ('first number');
n=1;

while n==1
    number=input ('enter next number');
    if number>biggest
        biggest=number;
    end
    n=input('enter 1 for more numbers, anyother for no');
end
%disp('biggest number is')
%disp(biggest)
fprintf('The biggest number is = %g',biggest)