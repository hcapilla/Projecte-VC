% Projecte VC
% Hernán Capilla Urbano, 1462773

%% Limpieza del espacio:
clear all
clc

%% Detección de cara:

% Creación de un objeto detector.
faceDetector = vision.CascadeObjectDetector();

% Leemos un frame y corremos el detector de caras.
videoReader = VideoReader('caraVideo4.mp4');
videoFrame      = readFrame(videoReader);
bbox            = step(faceDetector, videoFrame);

% Dibujamos un cuadrado entorno a la cara detectada.
videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
figure; imshow(videoFrame); title('Detected face');

% Convertimos el cuadrado en 4 puntos
% Sin esto no podríamos ver el cuadrado al rotar.
bboxPoints = bbox2points(bbox(1, :));

%% Identificación de los puntos faciales que trackear

points = detectMinEigenFeatures(rgb2gray(videoFrame), 'ROI', bbox);

% Mostramos los puntos.
figure, imshow(videoFrame), hold on, title('Detected features');
plot(points);

%% Inicializar el tracker para trackear los puntos creados:

pointTracker = vision.PointTracker('MaxBidirectionalError', 2);

% Inicializamos el tracker en las posiciones iniciales y en el frame
% inicial del video.
points = points.Location;
initialize(pointTracker, points, videoFrame);

%% Inicializar el reproductor de vídeo para mostrar los resultados:

videoPlayer  = vision.VideoPlayer('Position',...
    [100 100 [size(videoFrame, 2), size(videoFrame, 1)]+30]);

%% Trackear la cara:

oldPoints = points;

while hasFrame(videoReader)
    % Reproducir el siguiente frame del vídeo.
    videoFrame = readFrame(videoReader);

    % Trackear los puntos (algunos pueden presentar pérdidas).
    [points, isFound] = step(pointTracker, videoFrame);
    visiblePoints = points(isFound, :);
    oldInliers = oldPoints(isFound, :);
    
    if size(visiblePoints, 1) >= 2 % (Se requieren al menos 2 puntos).
        
        % Estimar las transformaciones geométricas entre los puntos del
        % viejo frame y del siguiente y eliminación de outliers.
        [xform, inlierIdx] = estimateGeometricTransform2D(...
            oldInliers, visiblePoints, 'similarity', 'MaxDistance', 4);
        oldInliers    = oldInliers(inlierIdx, :);
        visiblePoints = visiblePoints(inlierIdx, :);
        
        % Aplicar la transformación geométrica a los puntos vinculados.
        bboxPoints = transformPointsForward(xform, bboxPoints);
                
        % Inserción del cuadrado sobre el objeto siendo trackeado.
        bboxPolygon = reshape(bboxPoints', 1, []);
        videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, ...
            'LineWidth', 2);
                
        % Mostrar los puntos trackeados.
        videoFrame = insertMarker(videoFrame, visiblePoints, '+', ...
            'Color', 'white');       
        
        % Resetear los puntos.
        oldPoints = visiblePoints;
        setPoints(pointTracker, oldPoints);        
    end
    
    % Mostrar el vídeo usando el reproductor de vídeo.
    step(videoPlayer, videoFrame);
end

%% Limpieza del reproductor de vídeo.

% Limpieza para no obtener errores en otra ejecución.
release(videoPlayer);