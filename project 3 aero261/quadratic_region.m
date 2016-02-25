function [y] = quadratic_region(x,x0,x1,x2,y0,y1,y2)
    %calculates quadratic region

A=(y2/((x2-x0)*(x2-x1)))+(y1/((x1-x0)*(x1-x2)))+(y0/((x0-x1)*(x0-x2)));
B=-((y2*(x0+x1))/((x2-x0)*(x2-x1)))-((y1*(x0+x2))/((x1-x0)*(x1-x2)))-((y0*(x1+x2))/((x0-x1)*(x0-x2)));
C=((y2*x0*x1)/((x2-x0)*(x2-x1)))+((y1*x0*x2)/((x1-x0)*(x1-x2)))+((y0*x1*x2)/((x0-x1)*(x0-x2)));
y=((A)*(x^2))+((B)*x)+C;
end