num_grp = 3;
adj_mat = AdjMatrix('ego_nw_srikant.txt');

num_pts = length(adj_mat);

points = ones(num_pts,1);
for i = 1:num_pts
    points(i) = i;
end
[group1, cents1] = usr_kmeans(points, adj_mat, num_grp, 100);
%[group2, cents2] = usr_kmeans1(adj_mat, 3);

cents1 = cents1 + 1;
%cents2(:,1) = cents2(:,1) + 1;