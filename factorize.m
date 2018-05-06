function [A, D] = factorize(image, airlight,initial_depth, is_initial_depth, n_outer_iterations, n_inner_iterations, verbose, albedo_prior_weight, depth_prior_weight, depth_prior_type)
    [apow, ascale] = fit_epd(image);
    
    I_n = image;
    I_n(:,:,1) = image(:,:,1)./airlight(1);
    I_n(:,:,2) = image(:,:,2)./airlight(2);
    I_n(:,:,3) = image(:,:,3)./airlight(3);
    I_n = I_n./max(max(max(image)));
    
    z(1,1,:) = airlight;
    A = repmat(z,size(image,1),size(image,2),1);
    if (is_initial_depth == 0)
        D = compute_initial_depth(I_n);
    else
        D = initial_depth;
    end
    for i = 1:n_outer_iterations
        [A,D] = optimize(I_n, apow, ascale, A, D, 'A', n_inner_iterations, verbose, albedo_prior_weight, depth_prior_weight, depth_prior_type);
        [A,D] = optimize(I_n, apow, ascale, A, D, 'D', n_inner_iterations, verbose, albedo_prior_weight, depth_prior_weight, depth_prior_type);
    end
end