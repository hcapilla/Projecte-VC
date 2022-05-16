
positivas = load('positivas_table.mat');

negativeFolder = 'C:\Users\98cap\Documents\GitHub\Projecte-VC\negativo';

NumStages = 25;
FAR = 0.05;

trainCascadeObjectDetector('facedetector_25_5.xml',positivas, negativeFolder, ...
    'NumCascadeStages', NumStages, 'FalseAlarmRate',FAR);

%%

% positivas2 = load('positivas_table.mat');
% titulo = {'imageFilename'; positivas.positivas(:,1)};
% box = {'cara'; positivas.positivas(:,2)};
% 
% campo1 = 'imageFilename';
% campo2 = 'objectBoundingBoxes';
% s = struct(campo1, '', campo2, '');
% 
% test = positivas2.positivas(1, 1);
% s.cara(1) = positivas.positivas(1, 1);
% % save('s.mat','-struct', 's')
% for i = 2:50
%     s(i).imageFilename = '';
%     s(i).objectBoundingBoxes = [];
% end

%% 

negativeFolder = 'C:\Users\98cap\Documents\GitHub\Projecte-VC\negativo';

NumStages = 25;
FAR = 0.05;

trainCascadeObjectDetector('facedetector_25_5.xml',s, negativeFolder, ...
    'NumCascadeStages', NumStages, 'FalseAlarmRate',FAR);