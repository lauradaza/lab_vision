im1 = imread('2018.jpg');
im2 = imread('3063.jpg');
im3 = imread('5096.jpg');
im4 = imread('6046.jpg');
im5 = imread('8068.jpg');

num = 3;
col = {'rgb', 'rgb+xy', 'hsv', 'hsv+xy', 'lab', 'lab+xy'};
im = im1;
figure;
for i=1:length(col)
    tic
    s1 = segment_by_clustering(im, col{1,i}, 'k-means', num);
    s2 = segment_by_clustering(im, col{1,i}, 'gmm', num);
    s3 = segment_by_clustering(im, col{1,i}, 'hierarchical', num);
    s4 = segment_by_clustering(im, col{1,i}, 'watershed', num);
    toc
    subplot(4,6,1+(i-1)); image(s1); colormap(jet(num));
    subplot(4,6,7+(i-1)); image(s2); colormap(jet(num));
    subplot(4,6,13+(i-1)); image(s3); colormap(jet(num));
    subplot(4,6,19+(i-1)); image(s4);
end