function [ ] = findIsland( img, exercise )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

imgC=img;
count=1;



for i=2:479;
    for j=2:639;
        if(img(i,j)==0)
            if(img(i+1,j)==0)
                if(imgC(i+1,j)==0)
                    imgC(i,j)=count;
                    imgC(i+1,j)=count;
                    count=count+1;
                else
                    imgC(i,j)=imgC(i+1,j);
                end
            end
            if(img(i-1,j)==0)
                if(imgC(i-1,j)==0)
                    imgC(i,j)=count;
                    imgC(i-1,j)=count;
                    count=count+1;
                else
                    imgC(i,j)=imgC(i-1,j);
                end
            end
            if(img(i,j+1)==0)
                if(imgC(i,j+1)==0)
                    imgC(i,j)=count;
                    imgC(i,j+1)=count;
                    count=count+1;
                else
                    imgC(i,j)=imgC(i,j+1);
                end
            end
            if(img(i,j-1)==0)
                if(imgC(i,j-1)==0)
                    imgC(i,j)=count;
                    imgC(i,j-1)=count;
                    count=count+1;
                else
                    imgC(i,j)=imgC(i,j-1);
                end
            end       
        end
    end
end



figure 
image(imgC)
