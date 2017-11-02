
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