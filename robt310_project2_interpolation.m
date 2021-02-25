%homework2 (project)
%%
%Warm-up tasks
%Part1: task 1.1

% So x is a value indicating how big your output image compared to the input
% we feed it into function such called nni (nearest-neighbour interpolation)
% and it performs the required matrix operation with pixels
clear all;

A = imread('original_image.jfif');
D = imread('img.gif');
J = imread('lena_256.jpg');

x = 3;
V = nni(x); % for example the image should be x times larger
imshow(J); title("original image"); %original image
figure, imshow(V); title("obtained image after nearest-neighbour interpolation"); %obtained image using nearest-neighbour interpolation


function B = nni(x)
    J = imread('lena_256.jpg');
    [a,b] = size(J); 
    R = x*a; %output rows and columns/multiplying to the ratio
    C = x*b;
    
    IR = ceil( [1:R]./(x) ); %position is interpolated
    IC = ceil( [1:C]./(x) ); % and then it is rounded to greater or equal to value using ceil
    
    B = J(:,IR); %row-wise interpolation
    
    B = B(IC,:); %column-wise interpolation
   
end