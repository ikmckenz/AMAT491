clear;
x = linspace(-1,1,100);
hold on
for i = 1:5
    y = cos(i.*acos(x));
    ltext = strcat('\it i = ',int2str(i));
    plot(x,y,'DisplayName',ltext);
end
legend('show');
% line([-1,1],[0,0]);