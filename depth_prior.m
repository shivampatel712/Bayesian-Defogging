function Value =  depth_prior(depth, depth_prior_type)
    [A, B, C, D] = grid_diff(depth);
    if (strcmp(depth_prior_type, 'gaussian'))
        Value = sum(sum(sum(A.^2)))+sum(sum(sum(B.^2)))+sum(sum(sum(C.^2)))+sum(sum(sum(D.^2)));
        % For gausssian
    elseif (strcmp(depth_prior_type, 'laplace'))
        Value = sum(sum(sum(abs(A))))+sum(sum(sum(abs(B))))+sum(sum(sum(abs(C))))+sum(sum(sum(abs(D))));
        % For Laplace
    end
end