clear all
close all
clc

%%
load('positivas_struct.mat');

negativeFolder = 'C:\Users\98cap\Documents\GitHub\Projecte-VC\negativo';

NumStages = 10;
FAR = 0.000001;

trainCascadeObjectDetector('facedetector_10_000001.xml',positivas, negativeFolder, ...
    'NumCascadeStages', NumStages, 'FalseAlarmRate',FAR);

%%
load('positivas_struct.mat');

negativeFolder = 'C:\Users\98cap\Documents\GitHub\Projecte-VC\negativo';

% NumStages = 4;
FAR = 0.25;

trainCascadeObjectDetector('facedetector_def_25.xml',positivas, negativeFolder, ...
    'FalseAlarmRate',FAR);

%% IT WORKS

detector = vision.CascadeObjectDetector('facedetector_4_000001.xml');

I = imread("positivo\10.jpg");

bbox = step(detector, I);

J = insertShape(I, 'Rectangle',  bbox, 'LineWidth',10);
imshow(J)

release(detector)

%% Let's see

detector = vision.CascadeObjectDetector('facedetector_4_000001.xml');

I = imread("objetivo\3.jpg");

bbox = step(detector, I);

J = insertShape(I, 'Rectangle',  bbox, 'LineWidth',10);
imshow(J)

release(detector)















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

