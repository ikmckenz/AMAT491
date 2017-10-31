clear;
%addpath(genpath(pwd));

fun = @(x) (x.^2+1).^-1;

plotX = linspace(-1,1,100);

hold on 
trueY = fun(plotX);
plot(plotX, trueY,'DisplayName','f(x)');
for i = [5,10,20]
    Xi = [];
    j = 0:i;
    Xi = [(j/i).*2-1];    
    coeff = newton_dd(Xi,fun(Xi));
    plotY = [];
    for j = plotX
        plotY = [plotY, Horner_Newton(j,coeff,Xi,i)];
    end
    error = sum((plotY - trueY).^2);
    plot(plotX,plotY,'DisplayName',sprintf('P_{%d}(x), err=%d',i,error));
end
legend('show');
hold off
