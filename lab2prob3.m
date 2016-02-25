clear, clc
% Jeffery Schons and Kevin Dale Lab 2 prob 3 Sept 5
i=[200,500,700,1000,1200];
disp('Units   Bill ($)')
for units=i
    if units <= 500
        cost = units*.06;
    elseif units <= 1000
        cost = 30+((units-500)*.09);
    else
        cost = 75+((units-1000)*.15);
    end   
 fprintf('%g \t %g\n',units,cost)
end
