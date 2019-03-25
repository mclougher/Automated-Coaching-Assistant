function [ ] = evaluateForearms( skelStart, skelEnd )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global A;
global Sk;
global elbowArray;
global totalAdvice;


close all

leftElbowX=A((elbowArray(1)-1)*4+1+80*(Sk-1)+skelStart:480:skelEnd);
rightElbowX=A((elbowArray(2)-1)*4+1+80*(Sk-1)+skelStart:480:skelEnd);

leftElbowY=A((elbowArray(1)-1)*4+2+80*(Sk-1)+skelStart:480:skelEnd);
rightElbowY=A((elbowArray(2)-1)*4+2+80*(Sk-1)+skelStart:480:skelEnd);

hold on
plot(leftElbowX,leftElbowY,'b-o');
plot(rightElbowX,rightElbowY,'b-o');
axis([-1, 1, -1.5, 1.5]); 
xlabel('x-position');
ylabel('y-position');

[leftElbowX,leftElbowY]=removeOutliers(leftElbowX,leftElbowY);
[rightElbowX,rightElbowY]=removeOutliers(rightElbowX,rightElbowY);

figure
hold on
plot(leftElbowX,leftElbowY,'b-o');
plot(rightElbowX,rightElbowY,'b-o');
axis([-1, 1, -1.5, 1.5]);
xlabel('x-position');
ylabel('y-position');

std(leftElbowX);
std(rightElbowX);

if(std(leftElbowX)>.05 || std(rightElbowX)>.05)
    advice='Try not to bend your arms.';
else
    advice='Good job keeping your arms straight!';

end

    totalAdvice=strcat(totalAdvice,advice);
     
    h=msgbox(advice,'Feedback:');
    uiwait(h)


end

