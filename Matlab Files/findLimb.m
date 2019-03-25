function [ limbSlope1, limbSlope2 ] = findLimb( xpos, xneg, ypos, yneg, num )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

global xnegA;
global xposA;
global ynegA;
global yposA;

global xnegA2;
global xposA2;
global ynegA2;
global yposA2;

global thresholdImg;
global exercise;
global center;
global left;
global right;
global firstTime;
limb=thresholdImg;


if(firstTime)
    if(strcmpi(exercise, 'lat raises'))
        [left,center]=findLeft(thresholdImg);
        right=findRight(thresholdImg);
        hold on
%         plot(zeros(480)+center,1:480,'-');
        plot(zeros(480)+left,1:480,'-');
        plot(zeros(480)+right,1:480,'-');
        hold off
        if(num==1)
            [xposA, xnegA, yposA, ynegA]=extend(xpos, xneg, ypos, yneg, left);
            xpos=xposA;
            ypos=yposA;
            yneg=ynegA;
        else
            [xposA2, xnegA2, yposA2, ynegA2]=extend(xpos, xneg, ypos, yneg, right);
            xpos=xposA2;
            ypos=yposA2;
            yneg=ynegA2;
        end
    end
    
end



for i=1:480
    for j=1:640
        for k=1:3
            limb(i,j,k)=255;
        end
    end
end

figure
image(thresholdImg)

for i=1:480
    for j=1:size(xpos)
        if( i>ceil(yneg(j)) && i<ceil(ypos(j)) && thresholdImg(i,ceil(xpos(j)))>25 && thresholdImg(i,ceil(xpos(j)))<255 )
            limb(i,ceil(xpos(j)),:)=0;
        end
    end
end

% figure
% image(limb)




if(num==2)
    limbSlope2=bestFit(limb, num);
    limbSlope1=0;
else
    limbSlope2=0;
    limbSlope1=bestFit(limb, num);
end

end

