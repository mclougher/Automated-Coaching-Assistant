function [ slope ] = frameDiff(img1, img2)
%Isolate the differences between two frames

img3=img1;
global firstTime;
global thresholdImg;


%Display Original Images
figure
image(img1)
% imwrite(img1,'C:\Users\Michael\Documents\Multimedia KinectPics\1.bmp')
figure
image(img2)
% imwrite(img2,'C:\Users\Michael\Documents\Multimedia KinectPics\2.bmp')



for i=1:480;
    for j=1:640;
        
        %Isolating Body for first frame
        if(img1(i,j)>80 || img1(i,j)<8 );
            img1(i,j,:)=255;
        end
        
        %Isolating Body for second frame
        if(img2(i,j)>80 || img2(i,j)<8 );
            img2(i,j,:)=255;
        end
        
        %Draw every different pixel between the two frames as black
        %         if(abs(img2(i,j,1)-img1(i,j,1))-abs(img1(i,j,1)-img2(i,j,1))~=0)
        %             a=abs(img2(i,j,1)-img1(i,j,1))
        %             b=abs(img1(i,j,1)-img2(i,j,1))
        %         end
        
        if(firstTime)
            if(abs(img1(i,j,1)-img2(i,j,1)>1));
                img3(i,j,:)=0;
            else
                img3(i,j,:)=255;
            end
        else
            if(abs(img1(i,j,1)-img2(i,j,1)>1) || abs(img2(i,j,1)-img1(i,j,1)>1));
                img3(i,j,:)=0;
            else
                img3(i,j,:)=255;
            end
        end
        
    end
end

 

figure
image(img1)
% imwrite(img1,'C:\Users\Michael\Documents\Multimedia KinectPics\3.bmp')
figure
image(img2)
thresholdImg=img2;
% imwrite(img2,'C:\Users\Michael\Documents\Multimedia KinectPics\4.bmp')
figure
image(img3)
% imwrite(img3,'C:\Users\Michael\Documents\Multimedia KinectPics\5.bmp')

% findIsland(img3,exercise);


slope=cleanFrame(img3,img2);


end

