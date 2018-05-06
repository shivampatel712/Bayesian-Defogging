function f_and_g = create_f_and_g(I_n, apow, ascale, initial_depth, partial_type, npix, albedo_prior_weight, depth_prior_weight, depth_prior_type)
    f_and_g = @do_it;
    function [f, g] = do_it(x)
        g = zeros(size(x), 'like', x);
        a = reshape(x(1:3*npix), size(I_n));
        d = reshape(x(3*npix+1:end), size(initial_depth));
        display(2)
        if partial_type == 'A'
            display(3)
            [f, pg] = E_and_dE_A(I_n, a, d, apow, ascale, albedo_prior_weight, depth_prior_weight, depth_prior_type);
            g(1:3*npix) = pg(:);
        else
            display(4)
            [f, pg] = E_and_dE_D(I_n, a, d, apow, ascale, albedo_prior_weight, depth_prior_weight, depth_prior_type);
            g(3*npix+1:end) = pg(:); 
        end
    end
end