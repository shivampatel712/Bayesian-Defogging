function Value = albedo_prior(albedo, power, scale)
    color_sum = sum(sum(sum(repmat(albedo,1,1,3),3)));
    chromaticity = (color_sum>1e-8).*albedo./color_sum;
    X(1,1,:) = power;
    power = repmat(X,size(albedo,1),size(albedo,2),1);
    Y(1,1,:) = scale;
    scale = repmat(Y,size(albedo,1),size(albedo,2),1);
    Z = grid_diff(chromaticity);
    Value = sum((abs(Z).^power)./scale);
          
end
