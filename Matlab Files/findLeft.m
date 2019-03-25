function [ left, center ] = findLeft( img )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here


figure
image(img)
center=0;
left=0;
max=0;
maxChange=0;
num=zeros(640);
change=zeros(640);

for i=1:640
    for j=1:480
        if(img(j,i)~=255)
            num(i)=num(i)+1;
        end
    end
    if(num(i)>max)
        change(i)=num(i)-max;
        max=num(i);
        center=i;
    end
    if(i>150 && change(i)>maxChange)
        maxChange=change(i);
        left=i;
    end
end

end

