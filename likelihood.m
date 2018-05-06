function Value = likelihood(image, albedo, depth)
    D= -1.*repmat(depth,1,1,size(albedo,3));
    I_est = albedo.*exp(D)+(1-exp(D));
    diff = I_est-image;
    Value = sum(sum(sum(diff.^2)));
end