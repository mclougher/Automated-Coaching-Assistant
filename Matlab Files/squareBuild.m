function [ boolRect ] = squareBuild( pointx, pointy, r, img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% figure
% image(img)


x=[pointx,pointx,pointx+1,pointx-1];
y=[pointy+1,pointy-1,pointy,pointy];
x1=[];
y1=[];

tempx=pointx;
tempy=pointy;

%Top Right
while tempx<pointx+r
    x=horzcat(x,tempx+1);
    tempx=tempx+1;
end
while tempy<pointy+r
    y=horzcat(y,tempy+1);
    tempy=tempy+1;
end

%Top Left
tempx=pointx;
tempy=pointy;
while tempx>pointx-r
    x=horzcat(x,tempx-1);
    tempx=tempx-1;
end
while tempy<pointy+r
    y=horzcat(y,tempy+1);
    tempy=tempy+1;
end

%Top
tempx=x(size(x,2));
tempy=y(size(y,2));
while tempx<pointx+r
    x=horzcat(x,tempx+1);
    tempx=tempx+1;
    y=horzcat(y,tempy);
    x1=horzcat(x1,tempx);
    y1=horzcat(y1,tempy);
end

%Right
tempx=x(size(x,2));
tempy=y(size(y,2));
while tempy>pointy-r
    y=horzcat(y,tempy-1);
    tempy=tempy-1;
    x=horzcat(x,tempx);
    y1=horzcat(y1,tempy);
    x1=horzcat(x1,tempx);
end





%Bottom Left
tempx=pointx;
tempy=pointy;
while tempx>pointx-r
    x=horzcat(x,tempx-1);
    tempx=tempx-1;
end
while tempy>pointy-r
    y=horzcat(y,tempy-1);
    tempy=tempy-1;
end

%Bottom Right
tempx=pointx;
tempy=pointy;
while tempx<pointx+r
    x=horzcat(x,tempx+1);
    tempx=tempx+1;
end
while tempy>pointy-r
    y=horzcat(y,tempy-1);
    tempy=tempy-1;
end

%Bottom
tempx=x(size(x,2));
tempy=y(size(y,2));
while tempx>pointx-r
    x=horzcat(x,tempx-1);
    tempx=tempx-1;
    y=horzcat(y,tempy);
    x1=horzcat(x1,tempx);
    y1=horzcat(y1,tempy);
end


%Left
tempx=x(size(x,2));
tempy=y(size(y,2));
while tempy<pointy+r
    y=horzcat(y,tempy+1);
    tempy=tempy+1;
    x=horzcat(x,tempx);
    y1=horzcat(y1,tempy);
    x1=horzcat(x1,tempx);
end





boolRect=true;
for i=1:size(y1,2)
    if(x1(i)>1 && x1(i)<480 && y1(i)>1 && y1(i)<640)
        if(img(x1(i),y1(i))==0)
            boolRect=false;
        end
    end
end


end

