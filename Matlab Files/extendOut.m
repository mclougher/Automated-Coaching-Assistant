function [ xneg,xpos,yneg,ypos ] = extendOut( xneg,xpos,yneg,ypos,num )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

global thresholdImg;

go=1;
count=0;

 p=(ypos(200)-ypos(10))/(xneg(200)-xneg(10));

while go==1
    if(num==1)
           
        for i=max(yneg):max(ypos)
            if(max(yneg)>0 && max(ypos)<480 && thresholdImg( ceil(i), ceil(min(xneg))-1 )>25 && thresholdImg( ceil(i), ceil(min(xneg))-1 )<255)
                count=count+1;
            end
        end
        
        if(count>15)
            if(p<0)
                xpos=[min(xpos)-1;xpos];
                yneg=[max(yneg)-p;yneg];
                
                xneg=[min(xneg)-1;xneg];
                ypos=[max(ypos)-p;ypos];
            else
                xpos=[xpos;min(xpos)-1];
                yneg=[yneg;min(yneg)-p];
                
                xneg=[xneg;min(xneg)-1];
                ypos=[yneg;min(ypos)-p];
            end
            
        else
            go=0;
        end
        count=0;
        
        
        
    else

        
        for i=max(yneg):max(ypos)
            if(max(yneg)>0 && max(ypos)<480 && thresholdImg( ceil(i), ceil(max(xneg))+1 )>25 && thresholdImg( ceil(i), ceil(max(xneg))+1 )<255 )
                count=count+1;
            end
        end
        
        if(count>15)
            if(p<0)
                xpos=[max(xpos)+1;xpos];
                yneg=[min(yneg)+p;yneg];
                
                xneg=[max(xneg)+1;xneg];
                ypos=[min(ypos)+p;ypos];
            else
                xpos=[xpos;max(xpos)+1];
                yneg=[yneg;max(yneg)+p];
                
                xneg=[xneg;max(xneg)+1];
                ypos=[ypos;max(ypos)+p];
            end
            
        else
            go=0;
        end
        count=0;

    end
end



end

