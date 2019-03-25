function [ onBack ] = edgeOnBack( ptX, ptY, slope, img, sY , hY)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


         
    newimg=img;

    i=1;
    while abs(single(img(round(ptY-i*slope),ptX+i,1))-single(img(ptY,ptX,1)))<10 && abs(single(img(round(ptY-i*slope),ptX+i,2))-single(img(ptY,ptX,2)))<10 && abs(single(img(round(ptY-i*slope),ptX+i,3))-single(img(ptY,ptX,3)))<10
        i=i+1;        
    end
    
    newimg(ptY,ptX,1)=255;
    newimg(ptY,ptX,2)=0;
    newimg(ptY,ptX,3)=0;

    newX=ptX+i;
    newY=round(ptY-i*slope);

    newimg(newY,newX,1)=0;
    newimg(newY,newX,2)=255;
    newimg(newY,newX,3)=0;

    figure
    image(newimg)
    
   lastX=newX;
   lastY=newY;
   radius=0;
   found=false;
   
   xArray=[];
   yArray=[];
   
%Top Half of Spine
lastY
sY
 while lastY>sY 
%          radius=radius+1;
        for k=-radius:radius
            for j=-radius:radius
                if (k^2+j^2)-radius^2<1
                    newX=lastX+j;
                    newY=lastY+k;
                    if found==false && abs(single(img(round(newY-slope),newX+1,1))-single(img(newY,newX,1)))>3 && abs(single(img(round(newY-slope),newX+1,2))-single(img(newY,newX,2)))>3 && abs(single(img(round(newY-slope),newX+1,3))-single(img(newY,newX,3)))>3
                        newimg(newY,newX,1)=0;
                        newimg(newY,newX,2)=255;
                        newimg(newY,newX,3)=0;
                        xArray=[newX;xArray];
                        yArray=[newY;yArray];
                        found=true;
%                         figure
%                         image(newimg)
                        lastX=newX;
                        lastY=newY;
                        radius=1;
                    end
                end
            end
        end
    radius=radius+1;
    found=false;
 end

    

    figure
    image(newimg)
    
    radius=0;
  
%Bottom Half of Spine
while lastY<hY
    radius=radius+1;
    for k=-radius:radius
        for j=-radius:radius
            if (k^2+j^2)-radius^2<1
                newX=lastX+j;
                newY=lastY-k;
                if found==false && abs(single(img(round(newY-slope),newX+1,1))-single(img(newY,newX,1)))>3 && abs(single(img(round(newY-slope),newX+1,2))-single(img(newY,newX,2)))>3 && abs(single(img(round(newY-slope),newX+1,3))-single(img(newY,newX,3)))>3
                    newimg(newY,newX,1)=0;
                    newimg(newY,newX,2)=255;
                    newimg(newY,newX,3)=0;
                    found=true;
                    xArray=[newX;xArray];
                    yArray=[newY;yArray];
%                         figure
%                         image(newimg)
                    lastX=newX;
                    lastY=newY;
                    radius=1;
                end
            end
        end
    end
    radius=radius+1;
    found=false;
 end

    figure
    image(newimg)
    
    
    
hold on

x = xArray;
y = yArray;
p = polyfit(x,y,2);
f = polyval(p,x);
plot(x,f,'r');




end

