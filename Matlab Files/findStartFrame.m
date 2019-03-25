function [ output_args ] = findStartFrame( input_args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global handArray;
global A;
global Sk;
global pix2Cm;


arrayX=zeros(end1-start1+1,1);
arrayY=zeros(end1-start1+1,1);


estX=round(340+((A((handArray(1)-1)*4+3+80*(Sk-1)+fStart*480)-2.9)*100)/pix2Cm);
estY=240-round((A((handArray(1)-1)*4+2+80*(Sk-1)+fStart*480))*100/pix2Cm);

estX=320;
estY=400;

for i=start1:end1;

    img=imread(strcat('C:\KinectData\weightSide1\Depth\', num2str(i), '_depth.bmp'));
    
    [estX,estY]=findWeight(estX,estY,img);
    arrayX(i-start1+1)=estX;
    arrayY(i-start1+1)=estY; 
end




end

