% Detect Function - Based on Sobel.m

function Detect(im)

pkg load image

original = imread(im);

% -------------- Grayscale -------------- %
gray = rgb2gray (original);
gray = imadjust(gray);
figure (1);
imshow(gray, []);
title('Grayscale');

% -------------- Noisy -------------- %
noisy = imnoise ( gray , 'gaussian' ) ;
figure (2) ;
imshow ( noisy ) ;
title('Noisy');

% -------------- Gaussian -------------- %
h = fspecial ( 'gaussian' , [24 24] , 3 ) ;

M = conv2 ( double ( gray ) , double ( h ) ) ;
MG = (( M .^2) .^0.5);

figure (3) ;
imshow (MG , []) ;
title('Gaussian');

% -------------- Sobel -------------- %
k_v = [-1 0 1; -2 0 2; -1 0 1];
k_h = [1 2 1; 0 0 0; -1 -2 -1];

M1 = conv2 ( double ( gray ) , double ( k_v ) ) ;
M2 = conv2 ( double ( gray ) , double ( k_h ) ) ;
MS = ( M1 .^2+ M2 .^2) .^0.5;

figure (4) ;
imshow (MS , []) ;
title('Sobel');


% -------------- Sobel over Gaussian -------------- %
k_v = [-1 0 1; -2 0 2; -1 0 1];
k_h = [1 2 1; 0 0 0; -1 -2 -1];

M1_2 = conv2 ( double ( MG ) , double ( k_v ) ) ;
M2_2 = conv2 ( double ( MG ) , double ( k_h ) ) ;
MS2 = ( M1_2 .^2+ M2_2 .^2) .^0.5;

figure (5) ;
imshow (MS2 , []) ;
title('Sobel over Gaussian');

% -------------- Fill -------------- %
se = strel('square',2);
Close = imclose(MS2,se);
Dilate = imdilate(Close, se);
Fill = imfill(Dilate, 'holes');

figure (6) ;
imshow (Fill , []) ;
title('Fill');


% -------------- Inverse Colors -------------- %

inv = uint8(255) - MS;

figure (7) ;
imshow (inv , []) ;
title('Inverse');

% ------------------------------------------------

end

%There will be mx connected components.
%Here U can give a value between 1 and mx for L or in a loop you can extract all connected components
%If you are using the attached car image, by giving 17,18,19,22,27,28 to L you can extract the number plate completely.


