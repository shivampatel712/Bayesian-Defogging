function [final_albedo, final_depth] = optimize(I_n, apow, ascale, initial_albedo, initial_depth, partial_type, iters, verbose, albedo_prior_weight, depth_prior_weight, depth_prior_type)
    npix = numel(initial_depth);
    f_and_g = create_f_and_g(I_n, apow, ascale, initial_depth, partial_type, npix, albedo_prior_weight, depth_prior_weight, depth_prior_type);
    x0 = zeros(4*npix ,1);
    x0(1:3*npix) = initial_albedo(:);
    x0(3*npix+1:end) = initial_depth(:);
    
    l = ones(4*npix ,1);
    u = ones(4*npix ,1);
    l = l*1e-3;
    u(3*npix+1:end) = Inf;
    options = optimset('m',16,'tol',1e-8,'max_iters',iters);
    if verbose
        options = optimset(options, 'display', true);
    else 
        options = optimset(options, 'display', false);
    end
    x_opt = LBFGSB(f_and_g, x0, l, u, options);
    
    final_albedo = reshape(x_opt(1:3*npix), size(I_n));
    final_depth = reshape(x_opt(3*npix+1:end), size(initial_depth));
end