clear;

X = linspace(0,1,4);

plotX = linspace(0,1,100);

l30 = @(x) ((x-X(2)).*(x-X(3)).*(x-X(4))) / ...
    ((X(1)-X(2)).*(X(1)-X(3)).*(X(1)-X(4)));

l31 = @(x) ((x-X(1)).*(x-X(3)).*(x-X(4))) / ...
    ((X(2)-X(1)).*(X(2)-X(3)).*(X(2)-X(4)));

l32 = @(x) ((x-X(1)).*(x-X(2)).*(x-X(4))) / ...
    ((X(3)-X(1)).*(X(3)-X(2)).*(X(3)-X(4)));

l33 = @(x) ((x-X(1)).*(x-X(2)).*(x-X(3))) / ...
    ((X(4)-X(1)).*(X(4)-X(2)).*(X(4)-X(3)));

y30 = l30(plotX);
y31 = l31(plotX);
y32 = l32(plotX);
y33 = l33(plotX);

hold on
plot(plotX,y30,'DisplayName','L_{3,0}(x)');
plot(plotX,y31,'DisplayName','L_{3,1}(x)');
plot(plotX,y32,'DisplayName','L_{3,2}(x)');
plot(plotX,y33,'DisplayName','L_{3,3}(x)');
legend('show');
hold off