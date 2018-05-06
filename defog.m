function [final_albedo, final_depth] = defog(image, albedo_output, depth_output, outer_iters, inner_iters, final_airlight, albedo_prior_weight, depth_prior_weight, depth_prior_type, multi_scale, save_initial_depth, verbose)
    gamma = 2.0;
    if save_initial_depth
        z(1,1,:) = final_airlight;
        I_n = image./repmat(z,size(image,1),size(image,2),1);
        I_n = I_n./max(max(max(I_n)));
        d = compute_initial_depth(I_n);
        imwrite(1-d./max(max(max(d))), 'initial_depth.png');
    end
    
    if multi_scale
        scales = [0.5, 1.0];
        [final_albedo, final_depth] = factorize_multiscale(image, final_airlight, scales, outer_iters, inner_iters, verbose, albedo_prior_weight, depth_prior_weight, depth_prior_type);
    else
        [final_albedo, final_depth] = factorize(image, final_airlight,d ,0 , outer_iters, inner_iters, verbose, albedo_prior_weight, depth_prior_weight, depth_prior_type);
    end
    
    final_albedo = final_albedo./max(max(max(final_albedo)));
    final_depth = final_depth.^(1./gamma);
    
    if verbose
        display(['Saving albedo to ', albedo_output, '...']);
    end
    imwrite(final_albeo.*255, albedo_output);
    if verbose
        display(['Saving depth to ', depth_output, '...']);
    end
    imwrite(1-final_depth./max(max(max(final_depth))), depth_output);        
end

    
    
    