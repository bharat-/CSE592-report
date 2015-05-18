function cords = getCordinates(adj_mat, k)
% GETCORDINATES returns the cordinates for all the nodes in adjacency
% matrix. It retruns the first smallest eigen vector for laplacian.
deg_mat = DegMatrix(adj_mat);
lap_mat = deg_mat-adj_mat;

[eig_vect, eig_val] = eig(lap_mat);

cords = eig_vect(:,2:k);
