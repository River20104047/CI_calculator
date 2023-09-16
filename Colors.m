%% This code is for converting rgb color into grayscale
% 2023/06/24 By Zijiang yang

%% Preparework space
clc, clear, close all

%% Calculations
% Define the colors
colors = {'Black', 'Blue', 'Brown', 'Gray', 'Green', 'Orange', 'Pink', 'Purple', 'Red', 'White', 'Yellow'};
rgbValues = [0, 0, 0;        % Black
             0, 0, 255;      % Blue
             165, 42, 42;    % Brown
             128, 128, 128;  % Gray
             0, 128, 0;      % Green
             255, 165, 0;    % Orange
             255, 192, 203;  % Pink
             128, 0, 128;    % Purple
             255, 0, 0;      % Red
             255, 255, 255;  % White
             255, 255, 0];   % Yellow

% Create a figure
figure;

% Generate rectangles with the specified colors
for i = 1:numel(colors)
    rectangle('Position', [i-1, 0, 1, 1], 'FaceColor', rgbValues(i,:) / 255);
    text(i-0.5, 0.5, colors{i}, 'HorizontalAlignment', 'center');
end

% Set the axis limits
axis([-1, numel(colors), 0, 1]);

% Set the axis labels
xticks(0:numel(colors)-1);
xticklabels(colors);
yticks([]);

% Set the figure title
title('Color Figure');

% Save the figure (optional)
% saveas(gcf, 'color_figure.png');

% Convert RGB colors to grayscale
grayscaleValues = 0.2989 * rgbValues(:,1) + 0.5870 * rgbValues(:,2) + 0.1140 * rgbValues(:,3);

% Create a new figure
figure;

% Generate rectangles with the specified grayscale colors
for i = 1:numel(colors)
    rectangle('Position', [i-1, 0, 1, 1], 'FaceColor', [grayscaleValues(i), grayscaleValues(i), grayscaleValues(i)] / 255);
    
    % Choose text color based on grayscale value (closer to black or white)
    if grayscaleValues(i) > 128
        textColor = 'k'; % Black text for lighter background
    else
        textColor = 'w'; % White text for darker background
    end
    
    text(i-0.5, 0.5, sprintf('%s (%.2f)', colors{i}, grayscaleValues(i)/255), 'HorizontalAlignment', 'center', 'Color', textColor);
end

% Set the axis limits
axis([-1, numel(colors), 0, 1]);

% Set the axis labels
xticks(0:numel(colors)-1);
xticklabels(colors);
yticks([]);

% Set the figure title
title('Grayscale Figure');

% Save the figure (optional)
% saveas(gcf, 'grayscale_figure.png');



