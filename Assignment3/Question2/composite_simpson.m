function int =  composite_simpson(fname, a, b, n)
    h = (b-a)/n;
    
    firstterm = (h/6)*(fname(a) + fname(b));
    
    secondterm = 0;
    for k = 1:(n-1)
        secondterm = secondterm + fname(a + (k*h));
    end
    secondterm = secondterm * (h/3);
    
    thirdterm = 0;
    for k = 1:n
        thirdterm = thirdterm + fname(a + ((2*k -1)*(h/2)));
    end
    thirdterm = thirdterm * (2*h/3);
    
    int = firstterm + secondterm + thirdterm;
end