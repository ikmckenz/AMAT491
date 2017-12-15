function [x,iter] = myGaussSeidel(A,b,x0,nmax,tol)
    % Perform Gauss-Seidel method
    iter = 0;
    oldx = x0;
    newx = x0;
    linv = inv(tril(A));
    B = eye(size(A,1)) - linv*A;
    c = linv*b;
    
    % A bit of a complicated while condidtion, because Matlab
    % doesn't have the do-while loop.
    while ((relative_error(oldx,newx) > tol) || iter==0) && (iter < nmax)
        oldx = newx;
        newx = B*oldx + c;
        iter = iter + 1;
    end
    x = newx;
end
