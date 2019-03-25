function [ centerX, centerY] = findWeight( x, y, img, showFig, index, start1, end1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    radius=25;
    array1=zeros(round(pi*radius^2),1);
    array2=zeros(round(pi*radius^2),1);
    array3=zeros(round(pi*radius^2),1);
    newX=zeros(round(pi*radius^2),1);
    newY=zeros(round(pi*radius^2),1);
    original=img;
    new=original;
    count=1;
    persistent imgCell
    if isempty(imgCell)
        imgCell={};
    end

    %Buid Initial Circle
    for i=-radius:radius
        for j=-radius:radius
            if (i^2+j^2)-radius^2<1
                array1(count)=original(y+i,x+j,1);
                array2(count)=original(y+i,x+j,2);
                array3(count)=original(y+i,x+j,3);
                new(y+i,x+j,3)=200;
                newX(count)=j;
                newY(count)=i;
                count=count+1;
            end
        end
    end

    mode1=mode(single(array1));
    mode2=mode(single(array2));
    mode3=mode(single(array3));

    newTemp=0;
    newCount=1;

    while newTemp<newCount && radius<60
        newTemp=newCount;
        for i=-radius:radius
            for j=-radius:radius
                if (i^2+j^2)-radius^2<1 && (i^2+j^2)-(radius-1)^2>.1 && y+i>0 && x+j>0 && y+i<=size(original,1) && x+j<=size(original,2) && abs(mode1-single(original(y+i,x+j,1)))<5 && abs(mode2-single(original(y+i,x+j,2)))<5 && abs(mode3-single(original(y+i,x+j,3)))<5 && y+i<440 
                    new(y+i,x+j,3)=200;
                    newX(newCount+count)=j;
                    newY(count+newCount)=i;
                    newCount=newCount+1;
                end
            end
        end
    %     figure
    %     image(new)
        radius=radius+1;
    end

    centerX=round(x+mean(newX));
    centerY=round(y+mean(newY));


    if showFig
        new=drawX(new,centerX,centerY);
        newImg=resize(new);
    %     figure
    %     image(newImg)
        imgCell(index-start1+1)={newImg};
    end

    if index-start1+1==end1-start1
        F(end1-start1)=struct('cdata',[],'colormap',[]);    
        for j=1:end1-start1
            F(j)=im2frame(imgCell{j});
        end

            movie(F,1,30)
    end

end







