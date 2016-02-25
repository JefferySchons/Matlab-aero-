clear, clc
% Jeffery Schons and Kevin Dale Lab 1 part 2 prob a Aug 29
number=0;
for k=1:2.5:12
    number=number+k;
    if number<=5
        answer=0.5*number;
    elseif number<=10
        answer=number;
    else
        answer=2*number;
    end
end
display(k)
display(answer)
display(number)
    