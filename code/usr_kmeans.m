function [ idx, centers ] = usr_kmeans( points, adj_mat, num_grps, max_iter )
%usr_kemans k-means clustering

deg = sum(adj_mat);
num_points = length(points);

perm = randperm(num_points);
idx = ones(num_points,1);

i = 1;
j = 1;
centers = zeros(num_grps,1);
while i <= num_grps
    if deg(points(perm(j))) == 0
        idx(points(perm(j))) = num_grps+1;
    else
        centers(i) = points(perm(j));
        idx(points(perm(j))) = i;
        i = i+1;
    end
    j = mod(j+1, num_points);
    if j == 0
        j = num_points;
    end
end

dists = graphallshortestpaths(sparse(adj_mat), 'Directed', false);
iter = 0;
while (iter < max_iter)
    disp(iter);
    prev_centers = centers;
    max_dist = inf;
    for i = 1:num_points
        if deg(points(i)) ~= 0
            min_dist = max_dist;
            cent = 0;
            for j = 1:num_grps
                dist = dists(points(i), centers(j));
                if dist <= min_dist
                    min_dist = dist;
                    cent = j;
                end
            end
            grp_id = cent;
            idx(points(i)) = grp_id;
        else
            idx(points(i)) = num_grps+1;
        end
    end
    
    for i = 1:num_grps
        grp = find(idx==i);
        %disp(grp);
        tmp_cent = grp(1);
        min_dist = inf;
        for j = 1:length(grp)
            total_dist = 0;
            for k = 1:length(grp)
                dist = dists(grp(j), grp(k));
                total_dist = total_dist + dist;
            end
            if total_dist <= min_dist
                min_dist = total_dist;
                tmp_cent = grp(j);
            end
        end
        centers(i) = tmp_cent;
    end
    iter = iter+1;
    if (prev_centers == centers)
        break;
    end
end