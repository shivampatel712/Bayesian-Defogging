function Value = albedo_prior(albedo, power, scale)
    color_sum = sum(sum(sum(repmat(albedo,1,1,3),3)));
    chromaticity = (color_sum>1e-8).*albedo./color_sum;
    [P, Q, R, S] = grid_diff(chromaticity);
    X(1,1,:)=power;
    Y(1,1,:)=scale;
    Value = sum(sum(sum((abs(P).^repmat(X,size(P,1),size(P,2),1)./repmat(Y,size(P,1),size(P,2),1)))));
    Value = Value + sum(sum(sum((abs(R).^repmat(X,size(P,1),size(P,2),1)./repmat(Y,size(P,1),size(P,2),1)))));
    
    X1(1,1,:)=power;
    Y1(1,1,:)=scale;
    Value = Value + sum(sum(sum((abs(Q).^repmat(X1,size(Q,1),size(Q,2),1)./repmat(Y1,size(Q,1),size(Q,2),1)))));
    Value = Value + sum(sum(sum((abs(S).^repmat(X1,size(Q,1),size(Q,2),1)./repmat(Y1,size(Q,1),size(Q,2),1)))));
    
end
