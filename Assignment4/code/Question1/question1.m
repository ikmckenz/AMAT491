clear;

% Our original matrix using the efficient storage scheme
a = [2;3;12;-10;10];
b = [4;-3;-6;-10];
c = [2;3;4;1];

% What our TriLU function should return
l_actual = [2;3;-2;5];
d_actual = [2;-1;3;-2;5];
u_actual = [2;3;4;1];

[l, u, d] = TriLU(a,b,c);

assert(isequal(l,l_actual));
assert(isequal(d,d_actual));
assert(isequal(u,u_actual));
disp('Tests passed');
