function [ ] = evaluateFeetWidth( skelStart, skelEnd )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

global A;
global Sk;
global feetArray;
global shoulderArray;
global totalAdvice;

close all

goodLeft=true;
goodRight=true;
advice=' ';

leftFootX=A((feetArray(1)-1)*4+1+80*(Sk-1)+skelStart:480:skelEnd);
leftFootY=A((feetArray(1)-1)*4+2+80*(Sk-1)+skelStart:480:skelEnd);
rightFootX=A((feetArray(2)-1)*4+1+80*(Sk-1)+skelStart:480:skelEnd);
rightFootY=A((feetArray(2)-1)*4+2+80*(Sk-1)+skelStart:480:skelEnd);
centerShoulderX=A((shoulderArray(1)-1)*4+1+80*(Sk-1)+skelStart:480:skelEnd);
centerShoulderY=A((shoulderArray(1)-1)*4+2+80*(Sk-1)+skelStart:480:skelEnd);
leftShoulderX=A((shoulderArray(2)-1)*4+1+80*(Sk-1)+skelStart:480:skelEnd);
leftShoulderY=A((shoulderArray(2)-1)*4+2+80*(Sk-1)+skelStart:480:skelEnd);
rightShoulderX=A((shoulderArray(3)-1)*4+1+80*(Sk-1)+skelStart:480:skelEnd);
rightShoulderY=A((shoulderArray(3)-1)*4+2+80*(Sk-1)+skelStart:480:skelEnd);


hold on
    plot(leftFootX,leftFootY,'b-o');
    plot(rightFootX,rightFootY,'b-o');
    plot(centerShoulderX,centerShoulderY,'r-x');
    plot(leftShoulderX,leftShoulderY,'r-x');
    plot(rightShoulderX,rightShoulderY,'r-x');
    axis([-1, 1, -1.5, 1.5]); 
    xlabel('x-position');
    ylabel('y-position');


[leftFootX,leftFootY]=removeOutliers(leftFootX,leftFootY);
[rightFootX,rightFootY]=removeOutliers(rightFootX,rightFootY);
[leftShoulderX,leftShoulderY]=removeOutliers(leftShoulderX,leftShoulderY);
[rightShoulderX,rightShoulderY]=removeOutliers(rightShoulderX,rightShoulderY);


figure
hold on
    plot(leftFootX,leftFootY,'b-o');
    plot(rightFootX,rightFootY,'b-o');
    plot(centerShoulderX,centerShoulderY,'r-x');
    plot(leftShoulderX,leftShoulderY,'r-x');
    plot(rightShoulderX,rightShoulderY,'r-x');
    axis([-1, 1, -1.5, 1.5]); 
    xlabel('x-position');
    ylabel('y-position');

    if (mean(leftFootX)-mean(leftShoulderX))>0
        goodLeft=false;
    end
    
    if (mean(rightFootX)-mean(rightShoulderX))<0
        goodRight=false;
    end
    
if abs(mean(leftFootX)-mean(leftShoulderX))>.18
    goodLeft=false;
end


if abs(mean(rightFootX)-mean(rightShoulderX))>.18
    goodRight=false;
end


if (~goodLeft || ~goodRight)
    if(~goodLeft && goodRight)
       if mean(leftFootX)>mean(leftShoulderX)
           advice=sprintf('\nTry moving your right foot outwards.');
       end
    else
           advice=sprintf('\nTry moving your right foot inwards.');
    end
    
    if(~goodRight && goodLeft)
        if mean(rightFootX)>mean(rightShoulderX)
           advice=sprintf('\nTry moving your left foot inwards.');
        end
    else
           advice=sprintf('\nTry moving your left foot outwards.');
    end
    
    if(~goodRight && ~goodLeft)
        advice=sprintf('\nAlign both of your feet with your shoulders.');
    end    
else
    advice=sprintf('\nYour feet are a good distance apart.');
end


    totalAdvice=strcat(totalAdvice,advice);


    h=msgbox(advice,'Feedback:');
    uiwait(h)


end





