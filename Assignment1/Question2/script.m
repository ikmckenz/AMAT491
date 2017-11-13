clc;
clear;
format long;
root = 1.732050807568877293
xminus1 = 2;
xminus2 = 1;
disp('x                  & x-root\\')
for i = 1:10
  y = secant(xminus1,xminus2,3);
  xminus2 = xminus1;
  xminus1 = y;
  fprintf('%.18f & %.18f \\\\\n', xminus1, xminus1-root);
end
