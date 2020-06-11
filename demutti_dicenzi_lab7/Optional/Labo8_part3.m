%% Clear
close all;
clear all;
clc;

%% Load query image
imgpath = '../ImageMatching/images/Monster.jpg';
IQuery = rgb2gray(imread(imgpath));

%% Load gallery images
dir_jpg = '../ImageRetrieval/images/';
[imlist, gnd, qidx] = load_images(dir_jpg);

nimg = length(imlist);

imlist1 = imlist;
imlist1{length(imlist)+1} = '../ImageMatching/images/Monster.jpg';

numDetectedMatches = zeros(nimg, 1);
IQuery = imresize(IQuery, 0.5);

for i = 1:nimg
    imgpath = imlist{i};
    % Loading image i from gallery
    I = rgb2gray(imread(imgpath));
    I = imresize(I, 0.5);
    list = findMatches(IQuery, I, 'SIFT');
    numDetectedMatches(i) = length(list);
end

%% Image Retrieval

num_ranked_images = 10;
[numDetectedMatches, idx] = sort(numDetectedMatches, 'descend'); % sort descending
numDetectedMatches = numDetectedMatches(1:num_ranked_images, :);

% rank and show the results
idx = idx(1:num_ranked_images, :);

if num_ranked_images > size(idx, 1)
    num_ranked_images = size(idx, 1);
end

showranking(num_ranked_images, imlist1, length(imlist1), idx, numDetectedMatches);