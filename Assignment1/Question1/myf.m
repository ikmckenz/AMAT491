function X = myf(x)
    y = 1/4 + (x*x)/4 - x*sin(x) - 1/2 * cos(2*x);
    yp = (-1/2)*(x - 2*sin(x))*(2*cos(x) - 1);
    X = [y,yp];
end