function [ output_args ] = ImagesAndVideoExample(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


workingDir = tempname;
mkdir(workingDir)
mkdir(workingDir,'images')


shuttleVideo = VideoReader('shuttle.avi');



outputVideo = VideoWriter(fullfile(workingDir,'shuttle_out.avi'));
outputVideo.FrameRate = shuttleVideo.FrameRate;
open(outputVideo)



for i = 1:8
    img=imread(strcat('C:\Users\Michael\Dropbox\',num2str(5),'-Side\Depth\',num2str(i),'_depth.bmp'));
%     img = imread(fullfile(workingDir,'images',imageNames{ii}));
    writeVideo(outputVideo,img)
end


close(outputVideo)



shuttleAvi = VideoReader(fullfile(workingDir,'shuttle_out.avi'));



ii = 1;
while hasFrame(shuttleAvi)
   mov(ii) = im2frame(readFrame(shuttleAvi));
   ii = ii+1;
end



f = figure;
f.Position = [150 150 shuttleAvi.Width shuttleAvi.Height];

ax = gca;
ax.Units = 'pixels';
ax.Position = [0 0 shuttleAvi.Width shuttleAvi.Height];

image(mov(1).cdata,'Parent',ax)
axis off








end

