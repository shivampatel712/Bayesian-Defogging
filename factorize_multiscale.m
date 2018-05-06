function [A, D] = factorize_multiscale(orig_image, airlight, scales, n_outer_iterations, n_inner_iterations, verbose, albedo_prior_weight, depth_prior_weight, depth_prior_type)
    sorted_scales = sort(scales);
    is_initial_depth = 0;
    prev_d = 0;
    for i = 1:length(scales)
        scale = sorted_scales(1,i);
        image = imresize_float(orig_image, scale);
        if (is_initial_depth == 1)
            prev_d = imresize_float(prev_d, image.s);
        end
        [A,D] = factorize(image, airlight, prev_d, is_initial_depth, n_outer_iterations, n_inner_iterations, verbose, albedo_prior_weight, depth_prior_weight, depth_prior_type);
        is_initial_depth = 1;
        prev_d = D;
    end
end