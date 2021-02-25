% Part 2 – Visual illusion
clear all;

A = double(imread("lena_256.jpg"))./ 256;

    [a,b] = size(A);

    B = A;

% The algorithm scans the image from left to right, 
% top to bottom, quantizing pixel values one by one.
    for y = 1:a - 1
        for x = 2:b - 1
            old_pixel = B(y, x, :);
            new_pixel = round(B(y, x, :)); % as it is written in wikipedia

            B(y, x, :) = new_pixel;

            error = old_pixel - new_pixel;
            % Each time the quantization error is transferred to the neighboring pixels, 
            % while not affecting the pixels that already have been quantized.

            B(y, x + 1, :) = B(y, x + 1, :) + error .* 7 / 16; % there were made little change looking at the pseudocode
            B(y + 1, x - 1, :) = B(y + 1, x - 1, :) + error .* 3 / 16;
            B(y + 1, x, :) = B(y + 1, x, :) + error .* 5 / 16;
            B(y + 1, x + 1, :) = B(y + 1, x + 1, :) + error .* 1 / 16;
            
% Hence, if a number of pixels have been rounded downwards, it becomes more 
% likely that the next pixel is rounded upwards, such that on average, the 
% quantization error is close to zero.

        end
    end
    
    imshow(A); title("original");
    figure, imshow(B); title("applyed FLoyed-Steinberg dithering");