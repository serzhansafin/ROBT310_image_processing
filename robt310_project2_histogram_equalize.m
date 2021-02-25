% Part 1: task 1.2
% “mystery image" 
clear all;

A = imread("mystery_img.png");
H = histeq(A);
figure, imshow(H); title("histogram equalization");
% by applying histogram equalization we enhance the contrast of an image
% so looking at grey rectangles, I can see some alien, however before I
% could not see him much

% now using blockproc
fun = @(block_struct) histeq(block_struct.data);
I2 = blockproc(A,[40 40],fun);
figure, imshow(I2,[]); title("using blockproc");


% now using blockproc I can clearly see this strange alien
% so results are different, because when we have applied histogram
% equalization, it affected to the whole image, i.e. the cumulative distribution
% function (cdf) of entire image (as one block) was impacted 
% and when blockproc was used, the cdf of a block with the size 40 by 40 is
% only used. That is why when the block (40*40) with alien was affected
% by histeq, this block was enhanced and alien is appeared.


