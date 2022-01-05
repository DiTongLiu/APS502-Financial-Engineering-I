format longG

f = [-0.04 -0.03]'; %multiply objective function by -1 to convert into minimize problem
A = [1 1; 2 1; 3 4];
b = [100000; 150000; 360000];
lb = [0 0]';
ub = [];
Aeq = [];
beq = [];

[x, fval] = linprog(f,A,b,Aeq,beq,lb,ub);
fval = round(fval*-1); %multiply result by -1 since this was initially a maximize problem
x = round(x); % assume we can only buy whole units of each stock

x
fval