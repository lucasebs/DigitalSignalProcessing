% Code by: Sung Kim - August 20, 2013

% We can first read in the source image using the imread ()
% function . Since we are only operating on grayscale images ,
% we will take the gray transformation using rgb2gray () .
% Finally , we want to define our Sobel matrices , and use
% the built in convolution function conv () to convolve the
% source image with the Sobel kernels . For the sake of code
% reuse with multiple images , we will incorporate these
% operations into a function :

function Sobel ( im )
% Read in the image and convert to gray
orig = imread ( im ) ;
grayscale = rgb2gray ( orig ) ;

% Display the original and gray image
figure (1) ;
imshow ( grayscale ) ;
figure (2) ;
imshow ( orig ) ;
% Define the Sobel kernels
k_v = [ -1 0 1; -2 0 2; -1 0 1];
k_h = [1 2 1; 0 0 0; -1 -2 -1];
% Convolve the gray image with Sobel kernels , store result in
M1 and M2
M1 = conv2 ( double ( grayscale ) , double ( k_v ) ) ;
M2 = conv2 ( double ( grayscale ) , double ( k_h ) ) ;

% Display the horizontal edges and vertical edges separately
figure (3) ;
imshow ( abs ( M1 ) , []) ;
figure (4) ;
imshow ( abs ( M2 ) , []) ;

% Display the normalized vertical and horizontal edges
combined
figure (5) ;
imshow (( M1 .^2+ M2 .^2) .^0.5 , []) ;

end