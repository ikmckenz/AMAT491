function plot_newton_poly(X,Y)
    n = length(X)-1;
    A = newton_dd(X,Y);
    newX = linspace(-1,1);
    newY = [];
    for i = newX
        newY = [newY, Horner_Newton(i,A,X,n)];
    end
    plot(newX,newY,'-',X,Y,'x');
end
    