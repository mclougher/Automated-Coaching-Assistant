
function [ slope ] = cleanFrame(img,orig)
%Get rid of background "noise"

density=.4;
radius=4;

%Get rid of background "noise"
for i=1+radius:480-radius;
    for j=1+radius:640-radius;
        %For every black pixel found,find how many other black pixels are
        %in a given square of given "radius"
        if(img(i,j)==0);
            blackCount=1;
            for k=i-radius:i+radius;
                for h=j-radius:j+radius;
                    if(img(k,h)==0);
                        blackCount=blackCount+1;
                    end
                end
            end
            %If the the number of black pixels surrounding a certain pixel
            %does not exceed a given density, get rid of them
            if((blackCount/(4*radius*radius))<density);
                for k=i-radius:i+radius;
                    for h=j-radius:j+radius;
                        img(k,h,:)=255;
                    end
                end
             end
             
        end
    end
end

%Manually set all points on top edge to white
for i=1:radius;
    img(i,:)=255;
end
%Manually set all points on bottom edge to white
for i=480-radius:480;
    img(i,:)=255;
end
%Manually set all points on left edge to white
for j=1:radius;
    img(:,j)=255;
end
%Manually set all points on right edge to white
for j=640-radius:640;
    img(:,j)=255;
end


figure
image(img)





slope=cleanFrame2(img,orig);
% pause
end

