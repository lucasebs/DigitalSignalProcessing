% While we could manually define the equation for the Gaussian

% MATLAB provides the convenient function fspecial () , which
% accepts arguments for the distribution type and associated
% paramaters . We will store the output of the fspecial () in a
% variable , which we can convolve with the source image using
% the conv () function . As before , we will define the filtering
% operation as a function so that we can easily apply the
% filter to multiple images .

% The MATLAB standard library also includes the function
% imnoise () , which we will use to add various types of
% noise to the test image .

function MF = Gaussian ( im , size , sigma , noiseType )
% Display the original and gray image
original = imread ( im ) ;
grayscale = rgb2gray ( original ) ;


%figure (1) ;
%imshow ( original ) ;
%figure (2) ;
%imshow ( grayscale ) ;

% Add noise to the grayscale image and display
noisyImage = imnoise ( grayscale , noiseType ) ;
%figure (4) ;
%imshow ( noisyImage ) ;

% Generate Gaussian matrix
h = fspecial ( 'gaussian' , size , sigma ) ;

% Convolve the noised image with the Gaussian kernel
M = conv2 ( double ( grayscale ) , double ( h ) ) ;


MF = (( M .^2) .^0.5);

% Display the result
%figure (3) ;
% imshow (MF , []) ;

end