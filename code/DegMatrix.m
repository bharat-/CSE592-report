function deg_mat = DegMatrix(adj_mat)
% DEGMATRIX retruns the degree matrix for a given adjacency matrix
% adj_mat. Degree Matrix is a diagonal matrix, each diagonal element
% is the degree of corresponding node.
temp = sum(adj_mat, 2);
deg_mat = diag(temp);
