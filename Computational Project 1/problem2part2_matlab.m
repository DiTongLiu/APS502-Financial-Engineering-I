format longG

f = [108, 94, 99, 92.7, 96.6, 95.9, 92.9, 110, 104, 101, 107, 102, 95.2, 0, 0, 0, 0, 0]';

A = [-10, -7, -8, -6, -7, -6, -5, -10, -8, -6, -10, -7, -100, 1, 0, 0, 0, 0
    -10, -7, -8, -6, -7, -6, -5, -10, -8, -6, -110, -107, 0, -1, 1, 0, 0, 0
    -10, -7, -8, -6, -7, -6, -5, -110, -108, -106, 0, 0, 0, 0, -1, 1, 0, 0
    -10, -7, -8, -6, -7, -106, -105, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0
    -10, -7, -8, -106, -107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1
    -110, -107, -108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1
    54, 47, 49.5, 46.35, 48.3, 47.95, -46.45, -55, -52, -50.5, -53.5, -51, -47.6, 0, 0, 0, 0, 0];

b = [-500; -200; -800; -400; -700; -900; 0];

lb = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]';

ub = [];
Aeq = [];
beq = [];

[x, fval] = linprog(f,A,b,Aeq,beq,lb,ub);
x = round(x,4);
fval = round(fval,4);

x
fval