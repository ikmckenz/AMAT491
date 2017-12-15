function [l, u, d] = TriLU(a,b,c)
    % Perform an LU factorization on a tridiagonal matrix.    
    % Careful: there's no pivoting, so the
    % decomposition might not be stable
    
    n = size(a,1);
    assert(size(b,1) == n(1)-1,"Error, b must be length n-1");
    assert(size(c,1) == n(1)-1,"Error, c must be length n-1");
    
    b = [0;b];
    c = [c;0];
    
    l = zeros(n,1);
    u = zeros(n,1);
    d = zeros(n,1);
    
    u = c;
    d(1) = a(1);
    for s = 2:n
        l(s) = b(s)/d(s-1);
        d(s) = a(s) - l(s)*c(s-1);
    end
    l = l(2:n);
    u = u(1:n-1);
end
