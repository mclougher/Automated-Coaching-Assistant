function [ xneg,xpos,yneg,ypos ] = truncate(xneg,xpos,yneg,ypos,num)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here


global left;
global right;


if(num==1)
    xpos=sort(xpos);
    xneg=sort(xneg);
    ypos=sort(ypos, 'descend');
    yneg=sort(yneg, 'descend');
    while max(xpos)>left
        xpos=xpos(1:end-1);
        xneg=xneg(1:end-1);
        ypos=ypos(1:end-1);
        yneg=yneg(1:end-1);
    end
else
    xpos=sort(xpos);
    xneg=sort(xneg);
    ypos=sort(ypos);
    yneg=sort(yneg);
    while min(xpos)<right
        xpos=xpos(2:end);
        xneg=xneg(2:end);
        ypos=ypos(2:end);
        yneg=yneg(2:end);
    end
end

end

