function [x,fx,nf,af,bf] = newton_bisect(a,b,fname,tolx,nmax)
  % Initialize our variables
  nf = 0;
  newa = a;
  newb = b;
  newx = a;
  y = fname(newx);
  f = y(1);
  fp = y(2);
  ratio = f/fp;
  while ((abs(ratio) > tolx) || isnan(ratio)) && (nf<nmax)
    oldx = newx;
    % Perform one iteration of Newton's Method
    [newx,ratio] = newton_iter(newx,ratio,fname);
    % If the Newton step results in setting x to a NaN or Inf, discard it
    if isnan(newx) || isinf(newx)
      newx = oldx;
    end
    % If the Newton iteration took us out of the range, perform Bisection
    if (newx >= newb) || (newx <= newa)
      % Take a bisection step
      newx = (newa + newb)/2;
    end
    % Check for braketing and update a & b
    [bool,root] = bracketing(newx,newb,fname);
    if ~isnan(root)
      % If we found the root, return it
      x = root;
      nf = nf + 1;
      fx = feval(fname,x);
      fx = fx(1);
      af = newa;
      bf = newb;
      return
    elseif bool==true
      % If the root is bracketed by (x,b)
      newa = newx;
    elseif bool==false
      % If the root is bracketed by (a,x)
      newb = newx;
    end
    % Increment our counter
    nf = nf + 1;
  end
  % Set our variables appropriately 
  x = newx;
  fx = feval(fname,x);
  if fx > tolx
    disp('Error, did not converge')
    return
  end
  fx = fx(1);
  af = newa;
  bf = newb;
end

% Perform an iteration of Newton's Method
function [newx,ratio] = newton_iter(newx, ratio,fname)
  newx = newx - ratio;
  y = feval(fname,newx);
  f = y(1);
  fp = y(2);
  ratio = f/fp;
end

% Check if the root is bracketed by [a,b]
function [bool,root] = bracketing(a,b,fname)
  fL = feval(fname,a);
  fL = fL(1);
  fR = feval(fname,b);
  fR = fR(1);
  if fL*fR > 0
    bool = false;
    root = NaN;
    return
  % The following is to check if we found the actual root
  elseif fL*fR==0
    bool = false;
    if fL==0
      root = a;
    elseif fR==0
      root = b;
    end
    return
  else
    bool = true;
    root = NaN;
    return
  end
end
