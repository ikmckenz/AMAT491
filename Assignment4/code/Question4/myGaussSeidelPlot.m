function [X,iter] = myGaussSeidelPlot(A,b,x0,nmax)
    % Perform Gauss-Seidel method
    X = [];
    iter = 0;
    oldx = x0;
    newx = x0;
    linv = inv(tril(A));
    B = eye(size(A,1)) - linv*A;
    c = linv*b;
    
    % A bit of a complicated while condidtion, because Matlab
    % doesn't have the do-while loop.
    while (iter < nmax)
        oldx = newx;
        newx = B*oldx + c;
        iter = iter + 1;
        X = [X,relative_error(oldx,newx)];
    end
end
