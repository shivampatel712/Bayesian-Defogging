function Value = albedo_prior_grad(albedo, power, scale)
    
    color_sum = sum(sum(sum(repmat(albedo,1,1,3),3)));
    chromaticity = (color_sum>1e-8).*albedo./color_sum;
    [P, Q, R, S] = grid_diff(chromaticity);
    X(1,1,:)=power;
    Y(1,1,:)=scale;
    i=1;
    X=repmat(X,size(P,1),size(P,2),1);
    Y=repmat(Y,size(P,1),size(P,2),1);
    A = sign(P).*X.*(abs(P).^(X-1))./Y;
    A= (P>1e-8).*A;
    i=3;
    C = sign(R).*X.*(abs(R).^(X-1))./Y;
    C= (R>1e-8).*C;
    X1(1,1,:)=power;
    Y1(1,1,:)=scale;
    i=2;
    X=repmat(X1,size(Q,1),size(Q,2),1);
    Y=repmat(Y1,size(Q,1),size(Q,2),1);
    B = sign(Q).*X.*(abs(Q).^(X-1))./Y;
    B= (Q>1e-8).*B;
    i=4;
    D = sign(S).*X.*(abs(S).^(X-1))./Y;
    D= (S>1e-8).*D;
    Value = make_grad(A, B, C, D, albedo);
end