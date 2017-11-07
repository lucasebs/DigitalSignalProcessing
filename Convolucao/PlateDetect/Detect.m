% Detect Function - Based on Sobel.m

function Detect(im)

pkg load image

original = imread(im);

% -------------- Grayscale -------------- %
gray = rgb2gray (original);
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

% ----------------------------------------------------------
% -------------- Smoothing -------------- %
mask = [ 0 0 0 0 0;
         0 1 1 1 0;
         0 1 1 1 0;
         0 1 1 1 0;
         0 0 0 0 0];
[x, y] = size(MS);
Smooth = conv2(double(MS), double(mask));
figure (5) ;
imshow (MS , []) ;
title('Smooth');

% -------------- Max -------------- %
Label = bwlabel(Smooth, 8);
mx = max(max(Label))

% -------------- Zeros -------------- %
[r, c] = find(Label==1);
rc = [r c];
[sx sz] = size(rc);
n1 = zeros(x, y);

% -------------- n1 -------------- %
for i=1:sx
  x1=rc(i,1);
  y1=rc(i,2);
  n1(x1,y1)=255
end

figure(6)
imshow(n1, []);

end

%There will be mx connected components.
%Here U can give a value between 1 and mx for L or in a loop you can extract all connected components
%If you are using the attached car image, by giving 17,18,19,22,27,28 to L you can extract the number plate completely.


