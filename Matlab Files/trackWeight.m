function [ ] = trackWeight( fStart, start1, end1, showF )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

close all

global handArray;
global A;
global Sk;
global fileNum;
global totalAdvice;

pix2Cm=.42;
arrayX=zeros(end1-start1+1,1);
arrayY=zeros(end1-start1+1,1);


estX=round(340+((A((handArray(1)-1)*4+3+80*(Sk-1)+fStart*480)-2.9)*100)/pix2Cm);
estY=240-round((A((handArray(1)-1)*4+2+80*(Sk-1)+fStart*480))*100/pix2Cm);

    if showF
        orig=imread('C:\Users\Michael\Pictures\com495 Processing\bar0.png');
        image(orig)        
        pause(.1)
    end

for i=start1:end1;
    
    img=imread(strcat('C:\Users\Michael\Dropbox\',num2str(fileNum),'-Side\Depth\',num2str(i),'_depth.bmp'));
    [estX,estY]=findWeight(estX,estY,img,showF,i,start1,end1);
    
    %When weight first moves up bias estimate upwards
    if i-start1<30
        estY=estY-10;
    end
    arrayX(i-start1+1)=estX;
    arrayY(i-start1+1)=estY; 
    
end

img=resize(img);
figure
image(img)

hold on
plot(arrayX((1:size(arrayX,1)))*(496/640),(arrayY(1:size(arrayY,1)))*(496*.75/480),'r-x');
axis([0 496 0 496*.75])
std(arrayX);
if std(arrayX)>15
    advice=sprintf('\nTry to keep the bar moving straight up and down.');
else
    advice=sprintf('\nGood path of the bar up and down.');
end

    totalAdvice=strcat(totalAdvice,advice);

      
    h=msgbox(advice,'Feedback:');
    uiwait(h)

    

end

