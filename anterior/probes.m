% Projecte VC
% Hernán Capilla Urbano, 1462773

%% Limpieza del espacio:
clear all
close all
clc

%% Detección de cara:

[filename, pathname] = uigetfile('*.*', 'Select the Input Image');
filewithpath = strcat(pathname, filename);
img = imread(filewithpath);

faceDetector = vision.CascadeObjectDetector;
faceDetector.MergeThreshold = 5;

bboxes = faceDetector(img);

%%
if ~isempty(bboxes)
    imgf = insertObjectAnnotation(img, 'rectangle', bboxes, 'HERNÁN', 'LineWidth', 5, 'TextBoxOpacity',0.9,'FontSize',40);
    imshow(imgf);
    title('Detected faces');
else
    position=[0 0];
    label='No face Detected';
    imgn = insertText(img, position, label, 'BoxOpacity',1, 'TextBoxOpacity',0.9,'FontSize',40);
    imshow(imgn)
end



