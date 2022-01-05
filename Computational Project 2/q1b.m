format long g

R_array = [0.002053 0.002782 0.003511 0.00424 0.004969 0.005698 0.006427 0.007156 0.007885 0.008615]; % R values used
Q = [0.001205, -0.0001061, 0.00076; -0.0001061, 0.000123, 0.000008884;0.00076, 0.000008884, 0.001196;];
c = [0 0 0]';
A = -[0.008616, 0.002625, 0.002052];
Aeq = [1 1 1];
beq = [1];
ub = [inf; inf; inf;];
lb = [-inf; -inf; -inf;];
variance_array = zeros(10,1);
weights_matrix = zeros(10,3);

for i = 1:10 % for loop to sweep through R values
   b = R_array(i)*-1;
   [x, fval] = quadprog(Q, c, A, b, Aeq, beq, lb, ub); % each iteration of for loop calls quadprog with a new R value
   x = round(x,10);
   fval = round(fval,10);
   variance_array(i,:) = fval;
   weights_matrix(i,:) = x; 
end

variance_array % portfolio variance values
weights_matrix % weights of assets matrix (w1, w2, w3)
std_array = sqrt(variance_array); % portfolio std values

% h = plot(std_array, R_array, '-o') % efficient frontier plot
% title('Efficient Frontier')
% xlabel('Volatility \sigma')
% ylabel('Expected return goal R')
% ax = gca
% ax.YAxis.Exponent = 0;