clear; clc;

A = [10,-1,2,0;-1,11,-1,3;2,-1,10,-1;0,3,-1,8];
b = [6;25;-11;15];
x0 = [0;0;0;0];
sol = [1;2;-1;1];
tol = 10^-3;

% Perform Jacobi method
[x, iter] = myJacobi(A,b,x0,100,tol);
text = ['Jacobi method took ',...
        num2str(iter),...
        ' iterations'];
disp(text);
x

% Perform Gauss-Seidel method
[x, iter] = myGaussSeidel(A,b,x0,100,tol);
text = ['Gauss-Seidel method took ',...
        num2str(iter),...
        ' iterations'];
disp(text);
x
