% Demutti Marco
% Dicenzi Matteo

% The function displays the relative centroid and bounding box both on the
% segmented image, and on the color image.

% Inputs: segmented image, RGB color image (a title for the image to be 
% displayed)

function plotSegCentroidBoundaryBox(segmentedImage, image_rgb, imageTitle)

figure,subplot(2,1,1), imagesc(segmentedImage),colormap gray, 
title("Segmented " + imageTitle), hold on

% Find connected components (blobs).
labeledImage = logical(segmentedImage);

props = regionprops(labeledImage, 'Area', 'Centroid', 'BoundingBox');

% Get all the centroids.
centroids = [props.Centroid];
allXCentroids = centroids(1:2:end);
allYCentroids = centroids(2:2:end);

% Find the largest blob
allAreas = [props.Area];
[~, indexOfLargest] = max(allAreas);

% Plot centroid and bounding box
plot(allXCentroids(indexOfLargest), allYCentroids(indexOfLargest), '*r');
rectangle('Position',(props(indexOfLargest).BoundingBox),'EdgeColor',[1,0,0],'LineWidth',2);

% Plot centroid and bounding box on RGB image
subplot(2,1,2), imshow(image_rgb), title("Color " + imageTitle), hold on
plot(allXCentroids(indexOfLargest), allYCentroids(indexOfLargest), '*r');
rectangle('Position',(props(indexOfLargest).BoundingBox),'EdgeColor',[1,0,0],'LineWidth',2);

end
