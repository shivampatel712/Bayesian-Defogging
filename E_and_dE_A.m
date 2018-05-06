function [f, pg] = E_and_dE_A(I_n, a, d, apow, ascale, albedo_prior_weight, depth_prior_weight, depth_prior_type)
    display(5)
    f = likelihood(I_n, a, d) + albedo_prior_weight*albedo_prior(a, apow, ascale) + depth_prior_weight*depth_prior(d, depth_prior_type)
    pg = likelihood_grad_A(I_n, a, d) + albedo_prior_weight*albedo_prior_grad(a, apow, ascale);
    f = f/numel(d);
    pg = pg./numel(d);
    display(6)
end