%% Read images
s1 = imread('Sergio.jpg');
r = imread('Ragnar.jpg');
im1 = imcrop(s1,[160,100,619,719]);
imwrite(im1, 'Sergio_processed.jpg');
im2 = imcrop(r, [50,240,619,719]);
imwrite(im2, 'Ragnar_processed.jpg');
%% Filter images
c1 = 25; %cutoff frequency low-pass filter
c2 = 13; %cutoff frequency high-pass filter
f = fspecial('gaussian', c1*4+1, c1); 
f2 = fspecial('gaussian', c2*4+1, c2); 

im1h = imfilter(im1,f);
im2h = im2 - imfilter(im2,f2);
h = im1h + im2h;
imwrite(h, 'Hybrid_image.jpg');
%% Fast Fourier Transform
subplot(2,3,1); imshow(fft(im1)); title('Imagenes originales (FFT)');
subplot(2,3,2); imshow(fft(f)); title('Filtros (FFT)');
subplot(2,3,3); imshow(fft(im1h)); title ('Imagenes filtradas (FFT)');
subplot(2,3,4); imshow(fft(im2));
subplot(2,3,5); imshow(fft(f2));
subplot(2,3,6); imshow(fft(im2h));
pause; close;
%% Discrete Cosine Transform
dc1 = dct2(rgb2gray(im1)); dc2 = dct2(f); dc3 = dct2(rgb2gray(im1h));
dc4 = dct2(rgb2gray(im2)); dc5 = dct2(f2); dc6 = dct2(rgb2gray(im2h));
subplot(2,3,1); imshow(log(abs(dc1))); title('Imagenes originales (DCT)');
subplot(2,3,2); imshow(log(abs(dc2))); title('Filtros (DCT)');
subplot(2,3,3); imshow(log(abs(dc3))); title ('Imagenes filtradas (DCT)');
subplot(2,3,4); imshow(log(abs(dc4)));
subplot(2,3,5); imshow(log(abs(dc5)));
subplot(2,3,6); imshow(log(abs(dc6)));
pause; close;
%% Show images
% http://www.mathworks.com/matlabcentral/fileexchange/32094-imshow-with-true-size-for-multiple-images/content/imshowTruesize.m
% http://stackoverflow.com/questions/12984439/display-images-in-different-sizes-in-matlab
dim1 = 2;
dim2 = 4;
[imagesCellArray{1:dim1,1:dim2}] = deal(h); % create smaller images by imresize
 for iRow = 1:dim1
    for iCol = 1:dim2
       imagesCellArray{iRow,iCol} = imresize(imagesCellArray{iRow,iCol},1/(1.5*(iCol*iRow)));
    end
 end
 % plot with imshowTruesize - true aspect ratio is preserved
 margins = [25 25];
 Handles = imshowTruesize(imagesCellArray,margins);
 for iRow = 1:dim1
    for iCol = 1:dim2
       axis(Handles.hSubplot(iRow,iCol),'on')
    end
 end
 
pause; close all;