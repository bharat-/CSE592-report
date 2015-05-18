% Closeness centrality
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load friend graph data from file
data = dlmread('../srikant/ego_nw_srikant.txt');

% Initialize an adjacenty matrix (#friends x #friends)

n = 656;
m = 10576;

A = sparse(n, n);

% Populate the adjacenty matrix from loaded data
for i = 1:m
    row=data(i,1);
    col=data(i,2);
    if row == 1 || col == 1
        continue;
    end
    A(row-1,col-1)=1;
    A(col-1,row-1)=1;
end

% All pair shortest path
dist = graphallshortestpaths(A);

%dist(dist==inf) = 0;

% Closeness is based on the inverse of the distance of 
% each actor to every other actor in the network.

% Normalized closeness array
for i = 1:n
    close(i,1) = i+1;
    %tmp = sum(dist(i,:));
    tmp = 0;
    for j = 1:n
       % if (dist(i,j) ~= inf)
        if (i ~= j)
            tmp = tmp + 1/dist(i, j);
        end
    end
    
    if (tmp == 0)
        close(i,2) = 0;
        continue;
    end
    
    tmp = (tmp) * (n - 1);
    %tmp_n = (1 / tmp);

    close(i,2) = tmp;
end


% get the nodes with highest closeness values
closenessCentrality = sortrows(close, -2);

dlmwrite('../srikant/result_closeness_srikant.txt', closenessCentrality, 'delimiter','\t');



