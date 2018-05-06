function [f, pg] = E_and_dE_D(I_n, a, d, apow, ascale, albedo_prior_weight, depth_prior_weight, depth_prior_type)
    f = likelihood(I_n, a, d) + albedo_prior_weight*albedo_prior(a, apow, ascale) + depth_prior_weight*depth_prior(d, depth_prior_type);
    pg = likelihood_grad_D(I_n, a, d) + depth_prior_weight*depth_prior_grad(d, depth_prior_type);
    f = f/numel(d);
    pg = pg./numel(d);
end