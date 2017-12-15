function [X,iter] = myJacobiPlot(A,b,x0,nmax)
    % Implement the Jacobi method    
    X = [];
    iter = 0;    
    newx = x0;
    oldx = x0;
    dinv = inv(diag(diag(A)));
    B = eye(size(A,1)) - dinv*A;
    c = dinv*b;
    
    % A bit of a complicated while condidtion, because Matlab
    % doesn't have the do-while loop.
    while (iter < nmax)
        oldx = newx;
        newx = B*oldx + c;
        iter = iter + 1;
        X = [X, relative_error(oldx,newx)];
    end
end
