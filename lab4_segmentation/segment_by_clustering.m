function my_segmentation = segment_by_clustering(varargin)
switch nargin
    case 1
        imagen = varargin{1}; feature_space = 'rgb';
        clustering_method = 'k-means'; num_clusters = 10;
    case 2
        imagen = varargin{1}; feature_space = 'rgb';
        clustering_method = varargin{2}; num_clusters = 10;
    case 3
        imagen = varargin{1}; feature_space = varargin{2};
        clustering_method = varargin{3}; num_clusters = 10;
    case 4
        imagen = varargin{1}; feature_space = varargin{2};
        clustering_method = varargin{3}; num_clusters = varargin{4};
    otherwise
        error('La cantidad argumentos ingresada es invalida')
end

% Validation of the image
validateattributes(imagen, {'logical' 'numeric'},{'3d'});

% Selection of the feature_space
f_space = [size(imagen,1)*size(imagen,2), 3];
switch feature_space
    case 'rgb'
        im = imagen;
    case 'lab'
        im = rgb2lab(imagen);
    case 'hsv'
        im = rgb2hsv(imagen);
    case 'rgb+xy'
        im = imagen;
        f_space = [size(imagen,1)*size(imagen,2), 5];
    case 'lab+xy'
        im = rgb2lab(imagen);
        f_space = [size(imagen,1)*size(imagen,2), 5];
    case 'hsv+xy'
        im = rgb2hsv(imagen);
        f_space = [size(imagen,1)*size(imagen,2), 5];
    otherwise
        error('El Feature Space ingresado no es valido')
end

% Selection of the clustering method
switch clustering_method
    case 'k-means'
        mat = llenarMatriz(f_space,im);
        segm = kmeans(mat,num_clusters);
        seg_im = reshape(segm, [size(im,1),size(im,2)]);
    case 'gmm'
        im = imresize(im, [300,200]);
        f_space = [size(im,1)*size(im,2), 5];
        mat = llenarMatriz(f_space,im);
        obj = gmdistribution.fit(mat,num_clusters);
        clust = cluster(obj,mat);
        seg_im = reshape(clust, [size(im,1),size(im,2)]);
    case 'hierarchical'
        im = imresize(im, [120,80]);
        f_space = [size(im,1)*size(im,2), 5];
        mat = llenarMatriz(f_space,im);
        dist = pdist(mat,'cityblock'); lin = linkage(dist,'average');
        segm = cluster(lin,'maxclust',num_clusters);
        seg_im = reshape(segm, [size(im,1),size(im,2)]);
    case 'watershed'
        seg_im = watershed(im);
    otherwise
        error('El Clustering Method ingresado no es valido')
end

image(seg_im)
colormap(colorcube(num_clusters))
pause; close all;
end

function [matriz] = llenarMatriz(f_space,im)
matriz = zeros(f_space(1),f_space(2));
a = 0.9;
b = 1;
% fill color information
matriz(:,1) = a*reshape(im(:,:,1), [f_space(1),1]);
matriz(:,2) = a*reshape(im(:,:,2), [f_space(1),1]);
matriz(:,3) = a*reshape(im(:,:,3), [f_space(1),1]);
% fill location information
if(f_space(2) == 5)
    matriz(:,4) = b*repelem((1:size(im,2)), size(im,1));
    matriz(:,5) = b*repmat((1:size(im,1)), 1, size(im,2));
end
end
