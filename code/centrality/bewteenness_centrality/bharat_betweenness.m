% Bharat Singh
% Betweenness centrality

% Load friend graph data from file
%[data, n, m] = get_adj('ego_nw_arvind.txt');
[adj_mat, n, m] = get_adj_betweenness('../../../ego-dataset/ego_nw_bharat.txt');

%dlmread('../../../project/arvind/ego_nw_arvind.txt');

% Initialize an adjacenty matrix (#friends x #friends)
%A = sparse(n, n);
A = adj_mat;

% Populate the adjacenty matrix from loaded data
%for i = 1:m
%    row=data(i,1);
%    col=data(i,2);
    %if row == 1 || col == 1
        %continue;
    %end
%    A(row,col) = 1;
%    A(col,row) = 1;
%end

%s =sparse(y);
[bc,E] = betweenness_centrality(A);

for i = 1:n
    betweenness(i,1) = i;
    betweenness(i,2) = (bc(i)/((m-1)*(m-2)))*2;
end

betCentrality = sortrows(betweenness, -2);
%dlmwrite('result_between_bharat.txt', betCentrality, 'delimiter','\t');

