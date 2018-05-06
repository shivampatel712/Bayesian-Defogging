function Value = albedo_prior(albedo, power, scale)
    color_sum = sum(sum(sum(repmat(albedo,1,1,3),3)));
    chromaticity = (color_sum>1e-8).*albedo./color_sum;
    Z = grid_diff(chromaticity);
    Value=0;
    for i=1:4
        X(1,1,:)=power;
        Y(1,1,:)=scale;
        Value = sum(sum(sum((abs(Z(i,:,:,:)).^repmat(X,size(Z(i,:,:,:),1),size(Z(i,:,:,:),2),1)./repmat(Y,size(Z(i,:,:,:),1),size(Z(i,:,:,:),2),1)))));
    end
end
