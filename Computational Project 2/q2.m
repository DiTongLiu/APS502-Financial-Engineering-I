format long g

R_array = [0.002053 0.002782 0.003511 0.00424 0.004969 0.005698 0.006427 0.007156 0.007885 0.008615];
Q = [0.0012, -0.000106, 0.00076, 0.000307, 0.000941, 0.000165, 0.000607, 0.0012;
    -0.000106, 0.00012, 0.00000888, -0.0000564, 0.0000402, 0.0000468, -0.0000832, -0.000088;
    0.00076, 0.00000888, 0.0012, -0.000217, 0.00059, -0.000152, -0.0000175, 0.000536;
    0.000307, -0.0000564, -0.000217, 0.00239, 0.000912, 0.00116, 0.001287, 0.00053;
    0.000941, 0.0000402, 0.00059, 0.000912, 0.00297, 0.0004, 0.000718, 0.00135;
    0.000165, 0.0000468, -0.000152, 0.00116, 0.0004, 0.00353, 0.00082, 0.000438;
    0.000607, -0.0000832, -0.0000175, 0.00129, 0.000718, 0.00082, 0.00225, 0.000907;
    0.0012, -0.000088, 0.000536, 0.00053, 0.00135, 0.000438, 0.000907, 0.00259;
];
c = [0 0 0 0 0 0 0 0]';
A = -[0.008616, 0.002625, 0.002052, 0.01691, 0.01617, 0.01187, 0.01162, 0.01307];
Aeq = [1 1 1 1 1 1 1 1];
beq = [1];
ub = [inf; inf; inf; inf; inf; inf; inf; inf;];
lb = [-inf; -inf; -inf; -inf; -inf; -inf; -inf; -inf;];
variance_array = zeros(10,1);
weights_matrix = zeros(10,8);

for i = 1:10
   b = R_array(i)*-1;
   [x, fval] = quadprog(Q, c, A, b, Aeq, beq, lb, ub);
   x = round(x,5);
   fval = round(fval,10);
   variance_array(i,:) = fval;
   weights_matrix(i,:) = x; 
end

variance_array
weights_matrix
std_array = sqrt(variance_array);

% h = plot(std_array, R_array, '-o')
% title('Efficient Frontier')
% xlabel('Volatility \sigma')
% ylabel('Expected return goal R')
% ax = gca
% ax.YAxis.Exponent = 0
% ax.XAxis.Exponent = 0;