function [D] = compute_initial_depth(I_n)
   I_tilde =  log(1 - I_n);
   D = -1*max(I_tilde, [], 3);
   D_temp = D;
   D_temp(isnan(D_temp)) = -Inf;
   D_temp(isinf(D_temp)) = -Inf;
   Max = max(max(D_temp));
   D(isnan(D)) = Max;
   D(isinf(D)) = Max;
   D = max(D,1e-3);
end