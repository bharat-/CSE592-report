% Eigen vector centrality
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load friend graph data from file
data = dlmread('../bharat/ego_nw_bharat.txt');

n = 1998;
m = 66673;

% Initialize an adjacenty matrix (#friends x #friends)
A = zeros(n, n, 'double');

% Populate the adjacenty matrix from loaded data
for i = 1:m
    row=data(i,1);
    col=data(i,2);
    %if row == 1 || col == 1
        %continue;
    %end
    A(row,col)=1;
    A(col,row)=1;
end

% Calculate the eigen values and eigen vectors
[eigVectors,eigValues,W] = eig(A);

% Max eigen value is at 452 
max = n;

y=eigVectors(:, max);

% max value 
for i = 1:n
    eig1(i,1) = i;
    eig1(i,2) = y(i);
end

eigCentrality = sortrows(eig1, -2);	
dlmwrite('../bharat/result_eigen_bharat.txt', eigCentrality, 'delimiter','\t');


