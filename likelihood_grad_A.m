function Value = likelihood_grad_A(image, albedo, depth)
    D= -1.*repmat(depth,1,1,size(albedo,3));
    I_est = albedo.*exp(D)+(1-exp(D));
    diff = I_est-image;
    Value = 2.*exp(D).*diff;
end