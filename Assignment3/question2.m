clear;
% Let's test the degree of precision
disp('Testing x^k for degree of precision');
for n = 1:3
    X = ['Testing with ',num2str(n),' intervals'];
    disp(X);
    for k = 0:4
        myf = @(x) x.^k;
        approx = composite_simpson(myf,0,1,n);
        actual = integral(myf,0,1);
        X = ['x^',num2str(k),...
            ' , n=',num2str(n),...
            ' , Approx=',num2str(approx),...
            ' Actual=',num2str(actual)];
        disp(X);
    end
end

% Let's test using the test function
disp('Testing exp(3*x) for accuracy');
myf = @(x) exp(3*x);
approx = composite_simpson(myf,0,1,3);
actual = integral(myf,0,1);
disp(['Actual=',num2str(actual),' , Approx=',num2str(approx)]);
