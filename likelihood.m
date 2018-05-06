function Value = likelihood(image, albedo, depth)
    D= -1.*repmat(depth,1,1,size(albedo,3));
    I_est = albedo.*exp(d)+(1-exp(d));
    diff = I_est-image;
    Value = sum(sum(sum(diff.^2)));
end