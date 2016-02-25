clear, clc
% Jeffery Schons and Kevin Dale Lab 1 prob 1 Aug 29
N=input ('how many numbers in list:');
biggest=input ('first number');
for i=2:N  
    number=input ('enter next number');
    if number>biggest
        biggest=number;
    end
end
%disp('biggest number is')
%disp(biggest)
fprintf('The biggest number is = %g',biggest)
    

    
    