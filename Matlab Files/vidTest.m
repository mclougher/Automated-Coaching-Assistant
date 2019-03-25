function [  ] = vidTest(  )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

close all
frames=200;
F(frames)=struct('cdata',[],'colormap',[]);


orig=imread('C:\Users\Michael\Pictures\vTest.png');

image(orig)
pause(.1)
for i=1:frames
      img=imread(strcat('C:\Users\Michael\Dropbox\',num2str(5),'-Side\Depth\',num2str(i),'_depth.bmp'));

   
    y=372;
    x=496;
    
    newImg=zeros(y,x,3);
   
    for ii=1:y
        for j=1:x
            for k=1:3
                newImg(ii,j,k)=img(round(ii*(480/y)),round(j*(640/x)),k);
            end
        end
    end
%         if i==1
%             orig=newImg/255;
%         end
   F(i)=im2frame(newImg/255);
   
end



% pause
% axis([0 640 0 480])

movie(F,1,30);



















end

