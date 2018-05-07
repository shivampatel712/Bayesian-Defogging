function [grad] = make_grad(t, r, b, l, x)
    grad = zeros(size(x), 'like', x);
    grad(1:end-1,:,:) = grad(1:end-1,:,:) + t;
    grad(:,1:end-1,:) = grad(:,1:end-1,:) + r;
    grad(2:end,:,:) = grad(2:end,:,:) + b;
    grad(:,2:end,:) = grad(:,2:end,:) + l;
    grad(1,:,:) = grad(1,:,:) .* 4.0/3;
    grad(end,:,:) = grad(end,:,:) .* 4.0/3;
    grad(:,1,:) = grad(:,1,:) .* 4.0/3;
    grad(:,end,:) = grad(:,end,:) .* 4.0/3;
end