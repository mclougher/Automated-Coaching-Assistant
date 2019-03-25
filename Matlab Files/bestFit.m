function [ limbSlope ] = bestFit( img , num)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

limbArray=[];
global xnegA;
global xposA;
global ynegA;
global yposA;

global xnegA2;
global xposA2;
global ynegA2;
global yposA2;

global right;
global left;


for i=1:480
    for j=1:640;
        if(img(i,j)==0) 
            limbArray=[i,j;limbArray];
        end
    end
end


hold on

x = limbArray(:,2);
y = limbArray(:,1);
p = polyfit(limbArray(:,2),limbArray(:,1),1);
f = polyval(p,x);
plot(x,f,'r');
axis([0  640  0  480])



xShift=abs(p(1))*7;
yShift=(20-abs(p(1)))*5;

if(num==1)
    xnegA=x-xShift;
    xposA=x+xShift;
    ynegA=f-yShift;
    yposA=f+yShift;
    [xnegA,xposA,ynegA,yposA]=truncate(xnegA,xposA,ynegA,yposA,num);
    [xnegA,xposA,ynegA,yposA]=extendOut(xnegA,xposA,ynegA,yposA,num);
    [xposA, xnegA, yposA, ynegA]=extend(xposA, xnegA, yposA, ynegA, left);
    hold on
    plot(xnegA,yposA,'b');
    plot(xposA,ynegA,'b');
else
    xnegA2=x-xShift;
    xposA2=x+xShift;
    ynegA2=f-yShift;
    yposA2=f+yShift;
    [xnegA2,xposA2,ynegA2,yposA2]=truncate(xnegA2,xposA2,ynegA2,yposA2,num);
    [xnegA2,xposA2,ynegA2,yposA2]=extendOut(xnegA2,xposA2,ynegA2,yposA2,num);
    [xposA2, xnegA2, yposA2, ynegA2]=extend(xposA2, xnegA2, yposA2, ynegA2, right);
    hold on
    plot(xnegA2,yposA2,'b');
    plot(xposA2,ynegA2,'b');
end



hold off

limbSlope=p(1);

end

