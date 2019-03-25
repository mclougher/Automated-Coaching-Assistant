function [ slopeA ] = cleanFrame2( img, orig )
%
% radius2=8;
% a=[1,1];
% b=[1,1];
% boolRect=true;
array1=[];
array2=[];

global firstTime;
global thresholdImg;
global exercise;

if(strcmpi(exercise, 'bicep curls'))
    jstart=1;
    jend=640;
    kend=1;
end

if(strcmpi(exercise, 'lat raises'))
    jstart=1;
    jend=320;
    kend=2;
end

r=25;
% figure
% image (img)
% imwrite(img,'C:\Users\Michael\Documents\Multimedia KinectPics\6.bmp')


for k=1:kend
    for i=1:480;
        for j=1+(k-1)*320:640-(2-k)*320;
            if(img(i,j)==0)
                if(squareBuild(i,j,r,img))
                    img(i,j,:)=255;
                else
                    if(k==1)
                        array1=[i,j;array1];
                    end
                    if(k==2)
                        array2=[i,j;array2];
                    end
                end
            end
        end
    end
end

figure
image(img)
% imwrite(img,'C:\Users\Michael\Documents\Multimedia KinectPics\7.bmp')

% if(firstTime)
%     figure
%     image(thresholdImg);
% end



hold on

x1 = array1(:,2);
p1 = polyfit(array1(:,2),array1(:,1),1);
f1 = polyval(p1,x1);
plot(x1,f1,'r');
axis([0  640  0  480])

xShift1=abs(p1(1))*7;
yShift1=(18-abs(p1(1)))*5;

x1neg=x1-xShift1;
x1pos=x1+xShift1;
y1neg=f1-yShift1;
y1pos=f1+yShift1;

plot(x1neg,y1pos,'b');
plot(x1pos,y1neg,'b');
%
% for i=1:100
%     x1pos=[x1pos;max(x1pos)+1];
%     y1neg=[y1neg;min(y1neg)+p1(1)];
%
%     x1neg=[x1neg;max(x1neg)+1];
%     y1pos=[y1pos;min(y1pos)+p1(1)];
%
% end
%
% plot(x1pos,y1neg,'-');
% plot(x1neg,y1pos,'-');


if(strcmpi(exercise, 'lat raises'))
    x2 = array2(:,2);
    p2 = polyfit(array2(:,2),array2(:,1),1);
    f2 = polyval(p2,x2);
    plot(x2,f2,'r');
    xShift2=abs(p2(1))*7;
    yShift2=(10-abs(p2(1)))*5;
    
    x2neg=x2-xShift2;
    x2pos=x2+xShift2;
    y2neg=f2-yShift2;
    y2pos=f2+yShift2;
    
    plot(x2neg,y2pos,'b');
    plot(x2pos,y2neg,'b');
    
    
    %     axis([0  640  0  480])
end

% imwrite(img,'C:\Users\Michael\Documents\Multimedia KinectPics\8.bmp')
%
% line([0 (600-p(2))/p(1)]-xShift, [p(2) 600]+yShift)
%
% hold off

hold off
% pause



[slope1,~]=findLimb(x1pos,x1neg,y1pos,y1neg,1);


if(strcmpi(exercise, 'lat raises'))
    [~,slope2]=findLimb(x2pos,x2neg,y2pos,y2neg,2);
end


if(strcmpi(exercise, 'lat raises'))
    slopeA=[slope1,slope2];
else
    slopeA=slope1;
end


% cornerX1=[x-xShift;cornerX1];
% cX1=min(cornerX1);
% cornerY1=[f+yShift;cornerY1];
% cY1=min(cornerY1);
%
%
% cornerX2=[x+xShift;cornerX2];
% cX2=max(cornerX2);
% cornerY2=[f-yShift;cornerY2];
% cY2=max(cornerY2);


% for i=1:480;
%     for j=1:640;
%         if(orig(i,j,:)==255)
%             orig(i,j,2)=0;
%         end
%     end
% end


%
%
% figure
% image(orig)
%
% for i=1:480;
%     for j=1:640;
%         if(j<cX1||j>cX2)
%             orig(i,j,:)=255;
%         end
%     end
% end
%

% arrayY1=[];
% for i=p(2)-yShift:600-yShift
%     arrayY1=[i;arrayY1];
% end
% arrayY1=floor(arrayY1);
%
% arrayY2=[];
% for i=p(2)+yShift:600+yShift
%     arrayY2=[i;arrayY2];
% end
% arrayY2=floor(arrayY2);

% newImg=orig;
% for i=1:480
%     for j=1:640
%         newImg(i,j,:)=255;
%     end
% end
% %
% for i=1:numel(arrayY1)
%     for j=1:480
%         if(j>arrayY1(i)&&j<arrayY2(i))
%             %             j
%             %             i
%             %             arrayY1(i)
%             %             arrayY2(i)
%             %             pause
%
%             newImg(j,600-i,:)=orig(j,600-i,:);
%             orig(j,600-i,1)=0;
%         end
%     end
% end



% hold on
% figure
% image(orig)
%
%
%
% line([0 (600-p(2))/p(1)]+xShift, [p(2) 600]-yShift)
%
% line([0 (600-p(2))/p(1)]-xShift, [p(2) 600]+yShift)
%
% hold off

% figure
% image(newImg)
%


end

