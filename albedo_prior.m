function Value = albedo_prior(albedo, power, scale)
    color_sum = sum(sum(sum(repmat(albedo,1,1,3),3)));
    chromaticity = (color_sum>1e-8).*albedo./color_sum;
    
    Z = grid_diff(chromaticity);
    Value = sum((abs(Z).^power)./scale);
           
end
