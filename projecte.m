% Projecte VC
% Hernán Capilla Urbano, 1462773

%% Limpieza del espacio:
clear all
close all
clc

%% Escoger nStages
% load('positivas_struct.mat');
% 
% negativeFolder = 'C:\Users\98cap\Documents\GitHub\Projecte-VC\negativo';
% 
% NumStages = 10;
% FAR = 0.000001;
% 
% trainCascadeObjectDetector('facedetector_10_000001.xml',positivas, negativeFolder, ...
%     'NumCascadeStages', NumStages, 'FalseAlarmRate',FAR);

%% nStages auto
% load('positivas_struct.mat');
% 
% negativeFolder = 'C:\Users\98cap\Documents\GitHub\Projecte-VC\negativo';
% 
% % NumStages = 4;
% FAR = 0.25;
% 
% trainCascadeObjectDetector('facedetector_def_25.xml',positivas, negativeFolder, ...
%     'FalseAlarmRate',FAR);

%% CERCA

detector = vision.CascadeObjectDetector('facedetector_4_000001.xml');

I = imread("objetivo\4.jpg");

bbox = step(detector, I);

J_c = insertObjectAnnotation(I, 'rectangle', bbox, 'HERNÁN', 'LineWidth', 10, 'TextBoxOpacity', 0.9,'FontSize', 40);
figure; imshow(J_c); title('CERCA');

release(detector)

%% LEJOS

detector = vision.CascadeObjectDetector('facedetector_4_000001.xml');

I = imread("objetivo\5.jpg");

bbox = step(detector, I);

J_l = insertObjectAnnotation(I, 'rectangle', bbox, 'HERNÁN', 'LineWidth', 10, 'TextBoxOpacity', 0.9,'FontSize', 40);
figure; imshow(J_l); title('LEJOS');

release(detector)

%% VARIAS PERSONAS 1

detector = vision.CascadeObjectDetector('facedetector_4_000001.xml');

I = imread("objetivo\1.jpg");

bbox = step(detector, I);

J_v1 = insertObjectAnnotation(I, 'rectangle', bbox, 'HERNÁN', 'LineWidth', 10, 'TextBoxOpacity', 0.9,'FontSize', 40);
figure; imshow(J_v1); title('VARIAS PERSONAS 1');

release(detector)

%% VARIAS PERSONAS 2

detector = vision.CascadeObjectDetector('facedetector_4_000001.xml');

I = imread("objetivo\2.jpg");

bbox = step(detector, I);

J_v2 = insertObjectAnnotation(I, 'rectangle', bbox, 'HERNÁN', 'LineWidth', 10, 'TextBoxOpacity', 0.9,'FontSize', 40);
figure; imshow(J_v2); title('VARIAS PERSONAS 2');

release(detector)

%% VARIAS PERSONAS 3

detector = vision.CascadeObjectDetector('facedetector_4_000001.xml');

I = imread("objetivo\3.jpg");

bbox = step(detector, I);

J_v3 = insertObjectAnnotation(I, 'rectangle', bbox, 'HERNÁN', 'LineWidth', 10, 'TextBoxOpacity', 0.9,'FontSize', 40);
figure; imshow(J_v3); title('VARIAS PERSONAS 3');

release(detector)

montage({J_v1, J_v2, J_v3}, 'Size', [1 3])

%% DATASET POCHO

% detector = vision.CascadeObjectDetector('facedetector_4_000001.xml');
% 
% I = imread("datasetPocho\1.jpg");
% 
% bbox = step(detector, I);
% 
% J = insertObjectAnnotation(I, 'rectangle', bbox, 'HERNÁN', 'LineWidth', 10, 'TextBoxOpacity', 0.9,'FontSize', 40);
% 
% figure; imshow(J); title('NOT WORKING');
% 
% release(detector)














%%

% positivas2 = load('positivas_table.mat');
% titulo = {'imageFilename'; positivas.positivas(:,1)};
% box = {'cara'; positivas.positivas(:,2)};
% 
% campo1 = 'imageFilename';
% campo2 = 'objectBoundingBoxes';
% a = struct(campo1, '', campo2, '');
% % 
% % test = positivas2.positivas(1, 1);
% % a.cara(1) = positivas.positivas(1, 1);
% % save('s.mat','-struct', 's')
% for i = 2:50
%     a(i).imageFilename = 'C:';
%     a(i).objectBoundingBoxes = [];
% end

