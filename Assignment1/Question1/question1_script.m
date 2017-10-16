clear;
format long;
[x,fx,nf,af,bf] = newton_bisect(0.5,3,@myf,10^(-15),1000)

diff = x - 2.380061273139339
