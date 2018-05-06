function Value =  depth_prior_grad(depth, depth_prior_type)
    
    [P, Q, R, S] = grid_diff(depth);
    if (strcmp(depth_prior_type, 'gaussian'))
        P = 2*P;
        Q = 2*Q;
        R = 2*R;
        S = 2*S;
        % For gausssian
    elseif (strcmp(depth_prior_type, 'laplace'))
        P = sign(P);
        Q = sign(Q);
        R = sign(R);
        S = sign(S);
        % For Laplace
    end
    Value = make_grad(P,Q,R,S,depth); 
end