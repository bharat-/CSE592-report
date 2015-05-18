function [ group, imp_nodes ] = usr_kmeans1( adj_mat, num_grp )

cords = getCordinates(adj_mat, num_grp);

[group, ~] = kmeans(cords, num_grp);

imp_nodes = zeros(num_grp*2, 2);
index = 1;
for i = 1:num_grp
    tmp_grp = find(group==i);
    tmp_adj = zeros(length(tmp_grp));
    n = length(tmp_grp);
    if n > 1
        for j = 1:n
            for k = 1:n
                tmp_adj(j,k) = adj_mat(tmp_grp(j), tmp_grp(k));
            end
        end
    
        closenessCentrality = closeness_centrality(tmp_adj);
        imp_nodes(index,:) = [tmp_grp(closenessCentrality(1,1)), closenessCentrality(1,2)];
        index = index+1;
        imp_nodes(index,:) = [tmp_grp(closenessCentrality(2,1)), closenessCentrality(2,2)];
        index = index+1;
    else
        imp_nodes(index,:) = [tmp_grp(1), 0];
        index = index+1;
    end
end