function [y] = Linear_region(x,x0,x1,y0,y1)
    %calculates Linear region
y=(((y1-y0)/(x1-x0))*(x-x0))+y0;
end