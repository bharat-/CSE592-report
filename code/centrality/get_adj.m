function [adj_mat, n, m] = AdjMatrix(ego_net_file)

%ADJMATRIX returns the adjacency matrix for the ego network defined in
%file ego_net_file. This adjacency matrix doesn't include.  To be
%consistent, the raw data should be done in the following format.  The
%first line is the number of vertices. The ego is always labeled ID 1.
%The second line is the number of edges in the network. Starting from
%the third line each edge is presented as (i, j) meaning an edge
%between i and j.
fid = fopen(ego_net_file,'r');

rline = fgetl(fid);
num_nodes = str2num(rline);
rline = fgetl(fid);
num_edges = str2num(rline);

adj_mat = zeros(num_nodes-1);
edges = 1;
while (edges <= num_edges)
    rline = fgetl(fid);
    ids = sscanf(rline, '(%d,%d)');
    %if (ids(1) == 1)  |  (ids(2) == 1)
    %    edges = edges+1;
    %    continue;
    %end
    adj_mat(ids(1),ids(2)) = 1;
    adj_mat(ids(2),ids(1)) = 1;
    edges = edges + 1;
end
n = num_nodes;
m = num_edges;
fclose(fid);
