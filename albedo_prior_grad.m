function Value = albedo_prior_grad(albedo, power, scale)
    
    color_sum = sum(sum(sum(repmat(albedo,1,1,3),3)));
    chromaticity = (color_sum>1e-8).*albedo./color_sum;
    
    Z = grid_diff(chromaticity);
    grad = sign(Z).*power.*(abs(Z).^(power-1))./scale;
    Value = make_grid_grad((grad>1e-8).*grad,albedo);

end