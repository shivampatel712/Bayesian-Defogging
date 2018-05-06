%%%%% Clear all variables.
clc;
clear all;

%%%%% Please change variables here.
image_name = 'pumpkins-input.png';
albedo_output = 'final_albedo.png';
depth_output = 'final_depth.png';
outer_iters = 3;
inner_iters = 20;
airlight_provide = false;
airlight = [0.5; 0.5; 0.5];
airlight_rect_provide = true;
airlight_rect = [92, 19, 28, 16];
albedo_prior_weight = 2e-6;
depth_prior_weight = 1;
depth_prior_type = 'laplace';
multi_scale = false;
save_initial_depth = true;
verbose = true;

%%%%% Find airlight value.
input_image = double(imread(image_name));
input_image = input_image ./ 255.0;

if airlight_provide
    final_airlight = airlight;
elseif airlight_rect_provide
    X = airlight_rect(1);
    Y = airlight_rect(2);
    W = airlight_rect(3);
    H = airlight_rect(4);
    % [X, Y, W, H] = airlight_rect;
    final_airlight = reshape(mean(mean(input_image(Y:Y+H, X:X+W, :), 1), 2), 3, 1);
else
    imshow(input_image);
    airlight_rect = getrect;
    X = round(airlight_rect(1));
    Y = round(airlight_rect(2));
    W = round(airlight_rect(3));
    H = round(airlight_rect(4));
    final_airlight = reshape(mean(mean(input_image(Y:Y+H, X:X+W, :), 1), 2), 3, 1);
end

%%%%% Main function call.
[~,~] = defog(input_image, albedo_output, depth_output, outer_iters, inner_iters, ...
      final_airlight, albedo_prior_weight, depth_prior_weight, ...
      depth_prior_type, multi_scale, save_initial_depth, verbose);