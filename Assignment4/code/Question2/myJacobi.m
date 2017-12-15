function [x,iter] = myJacobi(A,b,x0,nmax,tol)
    % Implement the Jacobi method    
    iter = 0;    
    newx = x0;
    oldx = x0;
    dinv = inv(diag(diag(A)));
    B = (eye(size(A,1)) - dinv*A);
    c = dinv*b;
    
    % A bit of a complicated while condidtion, because Matlab
    % doesn't have the do-while loop.
    while ((relative_error(oldx,newx) > tol) || iter==0) && (iter < nmax)
        oldx = newx;
        newx = B*oldx + c;
        iter = iter + 1;
    end
    x = newx;
end
