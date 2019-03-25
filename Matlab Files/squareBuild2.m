function [ boolRect ] = squareBuild2( pointx, pointy, r, img )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

pointx=pointx-1;
pointy=pointy-1;
x1=[pointx];
y1=[pointy];

for i=1:r
    x1=horzcat(x1,pointx+i);
    y1=horzcat(y1,pointy);
    x1=horzcat(x1,pointx+i);
    y1=horzcat(y1,pointy-r);
    x1=horzcat(x1,pointx);
    y1=horzcat(y1,pointy-i);
    x1=horzcat(x1,pointx+r);
    y1=horzcat(y1,pointy-i);
end

% hold on
% scatter(y1,x1)
% hold off

boolRect=true;
for i=1:size(y1,2)
    if(img(x1(i),y1(i))==0)
        boolRect=false;
    end
end


end

