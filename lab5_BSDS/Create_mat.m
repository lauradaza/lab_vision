%% Add paths and create folders
folder = fullfile('BSR_full','BSR','BSDS500','data','images','test');
addpath(folder);
OutDir = fullfile('bench_fast','data','segs');
OutDir2 = fullfile('bench_fast','data','segs2');
OutDir3 = fullfile('bench_fast','data','segs3');
if ~exist(OutDir, 'dir')
   mkdir(OutDir);
end
if ~exist(OutDir2, 'dir')
   mkdir(OutDir2);
end
if ~exist(OutDir3, 'dir')
   mkdir(OutDir3);
end
% Create Struct
directorio = dir(folder);
%% Create .mat cells (Hierarchical and RGB)
% for i = 3:numel(directorio)-1
%     tic
%     im = imread(directorio(i).name);
%     segs = cell(1,5);
%     for j = 1:5
%         segs{j} = segment_by_clustering(im,'rgb','hierarchical',j*10);
%     end
%     [pathstr,name,ext] = fileparts(directorio(i).name);
%     save(fullfile(OutDir,name), 'segs');
%     toc
% end
% %% Create .mat cells (K-means con Lab)
% for i = 3:numel(directorio)-1
%     tic
%     im = imread(directorio(i).name);
%     segs = cell(1,5);
%     for j = 1:5
%         segs{j} = segment_by_clustering(im,'lab','k-means',j*10);
%     end
%     [pathstr,name,ext] = fileparts(directorio(i).name);
%     save(fullfile(OutDir2,name), 'segs');
%     toc
% end
%% Create .mat cells (Hierarchical and RGB)
for i = 3:numel(directorio)-1
    tic
    im = imread(directorio(i).name);
    segs = cell(1,5);
    for j = 1:5
        segs{j} = segment_by_clustering(im,'rgb','hierarchical',j+1);
    end
    [pathstr,name,ext] = fileparts(directorio(i).name);
    save(fullfile(OutDir3,name), 'segs');
    toc
end