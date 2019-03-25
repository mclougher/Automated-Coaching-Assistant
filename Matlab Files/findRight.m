function [ right ] = findRight( img )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here


figure
image(img)
right=0;
max=0;
maxChange=0;
num=zeros(640);
change=zeros(640);

for i=640:-1:1
    for j=480:-1:1
        if(img(j,i)~=255)
            num(i)=num(i)+1;
        end
    end
    if(num(i)>max)
        change(i)=num(i)-max;
        max=num(i);
    end
    if(i<490 && change(i)>maxChange)
        maxChange=change(i);
        right=i;
    end
end

end

