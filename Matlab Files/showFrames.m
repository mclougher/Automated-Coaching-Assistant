function [  ] = showFrames( start, end1, exercise1 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

slopeArray=[];
frameArray=[];
global xnegA;
global xposA;
global ynegA;
global yposA;
global xnegA2;
global xposA2;
global ynegA2;
global yposA2;
global thresholdImg;
global firstTime;
global exercise;
exercise=exercise1;
firstTime=true;

for i=start:end1-1;
    if(firstTime)
        slopeArray=[frameDiff(imread(strcat('C:\Users\mcloughe\Pictures\',exercise,'\KinectSnapshot-', num2str(i), '.bmp')),imread(strcat('C:\Users\mcloughe\Pictures\',exercise,'\KinectSnapshot-', num2str(i+1), '.bmp')));slopeArray];
%                 slopeArray=[frameDiff(imread(strcat('F:\Kinect Pics\', exercise, '\KinectSnapshot-', num2str(i), '.bmp')),imread(strcat('F:\Kinect Pics\', exercise, '\KinectSnapshot-', num2str(i+1), '.bmp')));slopeArray];
    else
%                 thresholdImg=imread(strcat('F:\Kinect Pics\',exercise,'\KinectSnapshot-', num2str(i+1), '.bmp'));
        thresholdImg=imread(strcat('C:\Users\mcloughe\Pictures\',exercise,'\KinectSnapshot-', num2str(i+1), '.bmp'));
        for k=1:480;
            for j=1:640;
                if(thresholdImg(k,j)>80 || thresholdImg(k,j)<8 );
                    thresholdImg(k,j,:)=255;
                end
            end
        end
        
        [x,~]=findLimb(xposA,xnegA,yposA,ynegA,1);
        
        
        if(strcmpi(exercise, 'lat raises'))
            [~,y]=findLimb(xposA2,xnegA2,yposA2,ynegA2,2);
            slopeArray=[x,y;slopeArray];
        else
            slopeArray=[x,slopeArray];   
        end
        
    end
    firstTime=false;
    frameArray=[i;frameArray];
    %     slopeArray
    
end

figure
if(strcmpi(exercise, 'lat raises'))
    evaluate(frameArray,slopeArray);
else
    plot(frameArray,slopeArray);
end

end

