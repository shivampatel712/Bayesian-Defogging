function [top, right, bottom, left] = grid_diff(grid)
    top = grid(1:end-1,:)-grid(2:end,:);
    right = grid(:,1:end-1)-grid(:,2:end);
    bottom = grid(2:end,:)-grid(1:end-1,:);
    left = grid(:,2:end)-grid(:,1:end-1);
end