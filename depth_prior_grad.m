function Value =  depth_prior_grad(depth, depth_prior_type)

    if (strcmp(depth_prior_type, 'gaussian'))
        V = (2.*grid_diff(depth));
        % For gausssian
    elseif (strcmp(depth_prior_type, 'laplace'))
        V = sign(grad_diff(depth));
        % For Laplace
    end
    Value = make_grid_grad(V,depth); 
end