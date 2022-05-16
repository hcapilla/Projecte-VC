clear all
clc

FDetect = vision.CascadeObjectDetector;

Image = imread("dataset/s1/1.jpg");
subplot(1,2,1), imshow(Image);

BB = step(FDetect, Image)

subplot(1,2,2), imshow(Image);
hold on
for i = 1:size(BB,1)
    rectangle('Position', BB(i,:), 'LineWidth',3, 'LineStyle','-', 'EdgeColor','r');
end
title('Face Detection');
hold off;