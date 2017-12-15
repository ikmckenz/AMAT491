function err = relative_error(oldx,newx)
    err = norm(newx-oldx, inf)/norm(newx, inf);
end
