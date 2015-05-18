function [ centroid ] = getCentroid( points, distance )
%getCentroid Calculate the centroid of multiple points.
%   point = vector of input points
%   distacnce = distance vector
%   centroid = calcuated centroid

num_points = length(points);

global_cent = points(1);
global_dist = sum(distance(:));
for index = 1:num_points
    tmp_cent = points(index);
    dist = 0;
    for j = 1:num_points
        dist = dist + distance(tmp_cent,points(j));
    end
    if dist <= global_dist
        global_dist = dist;
        global_cent = tmp_cent;
    end
end

centroid = global_cent;
end