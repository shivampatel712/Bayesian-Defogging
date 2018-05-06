function [final_albedo, final_depth] = defog(input_image, albedo_output, depth_output, outer_iters, inner_iters, final_airlight, albedo_prior_weight, depth_prior_weight, depth_prior_type, multi_scale, save_initial_depth, verbose)
    if save_initial_depth
        
end