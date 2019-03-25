function [ img ] = drawX( img, x ,y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

size=8;

for i=0:size
    img(y+i,x+i,1)=255;
    img(y+i,x+i,2)=0;
    img(y+i,x+i,3)=0;
    
    img(y+i,x-i,1)=255;
    img(y+i,x-i,2)=0;
    img(y+i,x-i,3)=0;
    
    img(y-i,x+i,1)=255;
    img(y-i,x+i,2)=0;
    img(y-i,x+i,3)=0;
    
    img(y-i,x-i,1)=255;
    img(y-i,x-i,2)=0;
    img(y-i,x-i,3)=0;
end

y=y+1; 
for i=0:size
    img(y+i,x+i,1)=255;
    img(y+i,x+i,2)=0;
    img(y+i,x+i,3)=0;
    
    img(y+i,x-i,1)=255;
    img(y+i,x-i,2)=0;
    img(y+i,x-i,3)=0;
    
    img(y-i,x+i,1)=255;
    img(y-i,x+i,2)=0;
    img(y-i,x+i,3)=0;
    
    img(y-i,x-i,1)=255;
    img(y-i,x-i,2)=0;
    img(y-i,x-i,3)=0;
end

 x=x+1; y=y-1;
for i=0:size
    img(y+i,x+i,1)=255;
    img(y+i,x+i,2)=0;
    img(y+i,x+i,3)=0;
    
    img(y+i,x-i,1)=255;
    img(y+i,x-i,2)=0;
    img(y+i,x-i,3)=0;
    
    img(y-i,x+i,1)=255;
    img(y-i,x+i,2)=0;
    img(y-i,x+i,3)=0;
    
    img(y-i,x-i,1)=255;
    img(y-i,x-i,2)=0;
    img(y-i,x-i,3)=0;
end

 x=x-2;
for i=0:size
    img(y+i,x+i,1)=255;
    img(y+i,x+i,2)=0;
    img(y+i,x+i,3)=0;
    
    img(y+i,x-i,1)=255;
    img(y+i,x-i,2)=0;
    img(y+i,x-i,3)=0;
    
    img(y-i,x+i,1)=255;
    img(y-i,x+i,2)=0;
    img(y-i,x+i,3)=0;
    
    img(y-i,x-i,1)=255;
    img(y-i,x-i,2)=0;
    img(y-i,x-i,3)=0;
end


y=y-1; x=x+1;
for i=0:size
    img(y+i,x+i,1)=255;
    img(y+i,x+i,2)=0;
    img(y+i,x+i,3)=0;
    
    img(y+i,x-i,1)=255;
    img(y+i,x-i,2)=0;
    img(y+i,x-i,3)=0;
    
    img(y-i,x+i,1)=255;
    img(y-i,x+i,2)=0;
    img(y-i,x+i,3)=0;
    
    img(y-i,x-i,1)=255;
    img(y-i,x-i,2)=0;
    img(y-i,x-i,3)=0;
end


end

