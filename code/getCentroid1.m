function [ centers ] = getCentroid1( points, cords, num_grp )
%getCentroid Calculate the centroid of multiple points.
%   point = vector of input points
%   distacnce = distance vector
%   centroid = calcuated centroid

num_points = length(points);
max_dist = 10000000;

centers = zeros(num_grp,1);
for i = 1:num_grp
    grp = find(points==i);
    tmp_cent = grp(1);
    min_dist = max_dist;
    for j = 1:length(grp)
        total_dist = 0;
        for k = 1:length(grp)
            total_dist = total_dist + sqrt(sum((cords(grp(j))-cords(grp(k))).^2));
        end
        if total_dist <= min_dist
            min_dist = total_dist;
            tmp_cent = grp(j);
        end
    end
    centers(i) = tmp_cent;
end