% Code by: Sung Kim - August 20, 2013

% Edit by: Lucas Emanuel Batista dos Santos - November, 2017
% Adapted to GNU Octave

% We can first read in the source image using the imread ()
% function . Since we are only operating on grayscale images ,
% we will take the gray transformation using rgb2gray () .
% Finally , we want to define our Sobel matrices , and use
% the built in convolution function conv () to convolve the
% source image with the Sobel kernels . For the sake of code
% reuse with multiple images , we will incorporate these
% operations into a function :

function M = Sobel (im,num)
% Load image package to use rgb2gray function
pkg load image

% Read in the image and convert to gray
orig = imread(im) ;
grayscale = rgb2gray ( orig ) ;
% Display the original and gray image
%figure (1) ;
%imshow ( grayscale ) ;
%title('Gray Scale');

%figure (2) ;
%imshow ( orig ) ;
%title('Original');

%figure (6) ;
%imshow ( bw ) ;
%title('Original');

% Define the Sobel kernels
k_v = [-1 0 1; -2 0 2; -1 0 1];
k_h = [1 2 1; 0 0 0; -1 -2 -1];

k_v2 = [-5 -4 0 4 5;
        -8 -10 0 10 8;
        -10 -20 0 20 10;
        -8 -10 0 10 8;
        -5 -4 0 4 5];
        
k_h2 = [5 8 10 8 5;
        4 10 20 10 4;
        0 0 0 0 0;
        -4 -10 -20 -10 -4;
        -5 -8 -10 -8 -5];

% Convolve the gray image with Sobel kernels , store result in M1 and M2
m1 = conv2 ( double ( grayscale ) , double ( k_v ) ) ;
m2 = conv2 ( double ( grayscale ) , double ( k_h ) ) ;

M1 = conv2 ( double ( grayscale ) , double ( k_v2 ) ) ;
M2 = conv2 ( double ( grayscale ) , double ( k_h2 ) ) ;

% Display the horizontal edges and vertical edges separately
%figure (3) ;
%imshow ( abs ( M1 ) , []) ;
%title('Vertical Edges');

%figure (4) ;
%imshow ( abs ( M2 ) , []) ;
%title('Horizontal Edges');

% Display the normalized vertical and horizontal edges combined
%figure (5) ;

m = ( m1 .^2+ m2 .^2) .^0.5;

%figure (5) ;
figure (1) ;
imshow (m, []);
title('Edges - Sobel');

M = ( M1 .^2+ M2 .^2) .^0.5;

figure (2) ;
imshow (M, []);
title('Edges - Sobel2');

i = uint8(255) - m;

figure (3) ;
imshow (i, []);
title('Inverted Edges - Sobel');


end