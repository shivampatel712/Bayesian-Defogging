function Value =  depth_prior(depth, depth_prior_type)

    if (strcmp(depth_prior_type, 'gaussian'))
        Value = sum(sum(sum(grid_diff(depth).^2)));
        % For gausssian
    elseif (strcmp(depth_prior_type, 'laplace'))
        Value = sum(sum(sum(abs(grid_diff(depth)))));
        % For Laplace
    end
end