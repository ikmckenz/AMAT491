function A = newton_dd(X,Y)
     order = length(X);
     for i = 1:order
         newX = X(1:i);
         newY = Y(1:i);
         A(i) = div_diff(newX,newY);
     end
end
   
function a = div_diff(X,Y)
    order = length(X);
    if (order==1)
        a = Y(1);
        return
    else
        a = ((div_diff(X(2:end),Y(2:end))) - (div_diff(X(1:end-1),Y(1:end-1))))/(X(length(X))-X(1));
        return
    end
end
