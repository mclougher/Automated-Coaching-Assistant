function [ newX, newY, newImg ] = findBack( ptX, ptY, slope, img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    i=1;
    newImg=img;
    if slope<0
        slope=slope^-1;
        while abs(single(img(ptY-i,round(ptX-i*slope),1))-single(img(ptY,ptX,1)))<10 && abs(single(img(ptY-i,round(ptX-i*slope),2))-single(img(ptY,ptX,2)))<10 && abs(single(img(ptY-i,round(ptX-i*slope),3))-single(img(ptY,ptX,3)))<10
            i=i+1;
        end
            newX=round(ptX-i*slope);
            newY=ptY-i; 

        newImg(ptY,ptX,1)=255;
        newImg(ptY,ptX,2)=0;
        newImg(ptY,ptX,3)=0;

        newImg(ptY+1,ptX,1)=255;
        newImg(ptY+1,ptX,2)=0;
        newImg(ptY+1,ptX,3)=0;

        newImg(ptY-1,ptX,1)=255;
        newImg(ptY-1,ptX,2)=0;
        newImg(ptY-1,ptX,3)=0; 
        
        
    elseif slope<1
        
        while abs(single(img(round(ptY-i*slope),ptX+i,1))-single(img(ptY,ptX,1)))<10 && abs(single(img(round(ptY-i*slope),ptX+i,2))-single(img(ptY,ptX,2)))<10 && abs(single(img(round(ptY-i*slope),ptX+i,3))-single(img(ptY,ptX,3)))<10
            i=i+1;        
        end
            newX=ptX+i;
            newY=round(ptY-i*slope); 


        newImg(ptY,ptX,1)=255;
        newImg(ptY,ptX,2)=0;
        newImg(ptY,ptX,3)=0;

        newImg(ptY,ptX-1,1)=255;
        newImg(ptY,ptX-1,2)=0;
        newImg(ptY,ptX-1,3)=0;

        newImg(ptY,ptX-2,1)=255;
        newImg(ptY,ptX-2,2)=0;
        newImg(ptY,ptX-2,3)=0;


    else
        slope=slope^-1;
        while abs(single(img(ptY-i,round(ptX+i*slope),1))-single(img(ptY,ptX,1)))<10 && abs(single(img(ptY-i,round(ptX+i*slope),2))-single(img(ptY,ptX,2)))<10 && abs(single(img(ptY-i,round(ptX+i*slope),3))-single(img(ptY,ptX,3)))<10
            i=i+1;
        end
            newX=round(ptX+i*slope);
            newY=ptY-i; 

        newImg(ptY,ptX,1)=255;
        newImg(ptY,ptX,2)=0;
        newImg(ptY,ptX,3)=0;

        newImg(ptY+1,ptX,1)=255;
        newImg(ptY+1,ptX,2)=0;
        newImg(ptY+1,ptX,3)=0;

        newImg(ptY-1,ptX,1)=255;
        newImg(ptY-1,ptX,2)=0;
        newImg(ptY-1,ptX,3)=0; 
    end
    
    newImg(newY,newX,1)=0;
    newImg(newY,newX,2)=255;
    newImg(newY,newX,3)=0;


%     figure
%     image(newImg)



end

