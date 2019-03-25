function [  ] = testD( num )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


lineArray=[];

img = imread(strcat('C:\KinectData\Side\Depth\',num2str(num),'_depth.bmp'));

figure
image(img)


for i=1:480;
    for j=1:640;      
        %Isolating Body for first frame
        if(img(i,j,2)<65 || img(i,j,2)>68);
            img(i,j,:)=255;
        end
    end
end

figure
image(img)

for i=1:480;
    center=0;
    count=0;
    for j=1:640;
        if(img(i,j,1)~=255);
            center=center+j;
            count=count+1;
        end
    end
    if(count~=0 && i<200)
        img(i,ceil(center/count),1)=255;
        img(i,ceil(center/count),2)=255;
        img(i,ceil(center/count),3)=0;
        lineArray=[ceil(center/count),i;lineArray];
    end
end
        

figure
image(img)

lineArray

hold on

x = lineArray(:,1);
y = lineArray(:,2);
p = polyfit(x,y,1);
f = polyval(p,x);
plot(x,f,'r');
%axis([0  640  0  480])

% a=(1:100);
% b=(1:4:400);
% p=polyfit(a',b',2);
% f=polyval(p,a');
% plot(a',f,'r');






hold off




end

