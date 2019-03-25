% fullFileName = 'C:\Users\Michael\Pictures\f1kpj.gif';
% [gifImage, cmap] = imread(fullFileName, 'Frames', 'all');
% size(gifImage)
% figure
% image(gifImage,cmap)
% % implay(gifImage);


close all
hFig = figure('Color','w'); 
je = javax.swing.JEditorPane('text/html', '<html><img src="file:/C:\Users\Michael\Pictures\f1kpj.gif"/></html>');
[hj, hc] =  javacomponent(je,[],hFig)
% size(je)
set(hc, 'pos', [200,10,150,150])