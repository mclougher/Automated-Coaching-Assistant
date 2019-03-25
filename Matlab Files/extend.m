function [ xpos, xneg, ypos, yneg ] = extend( xpos, xneg, ypos, yneg, bound )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

global center;

%calculate slope

if(bound<center)
    p=(min(ypos)-max(ypos))/(max(xpos)-min(xpos));
else
    p=(min(ypos)-max(ypos))/(min(xpos)-max(xpos));
end


if(bound<center)
    bound=bound-max(xpos);
else
    bound=min(xneg)-bound;
end

%extend towards middle
for i=1:bound

    if(p<0)
        xpos=[xpos;max(xpos)+1];
        yneg=[yneg;min(yneg)+p];

        xneg=[xneg;max(xneg)+1];
        ypos=[ypos;min(ypos)+p];
    else
        xpos=[xpos;min(xpos)-1];
        yneg=[yneg;min(yneg)-p];

        xneg=[xneg;min(xneg)-1];
        ypos=[ypos;min(ypos)-p];
    end


end

hold on
plot(xpos,yneg,'-');
plot(xneg,ypos,'-');
hold off

% extend away from middle
% while(boolExtend==1)
%     
%     if(p<0)
%         xpos=[xpos;min(xpos)-1];
%         yneg=[yneg;max(yneg)-p];
%         
%         xneg=[xneg;min(xneg)-1];
%         ypos=[ypos;max(ypos)-p];
%         %         ceil(max( min(xpos), min(xneg)))
%         %         min( max(ypos), max(yneg))
%         %         max( max(ypos), max(yneg))
%         %         pause
%         boolExtend=0;
%         
%         
%         for j=min( max(ypos), max(yneg)):max( max(ypos), max(yneg))
%             
%           
%             if ( ceil(max( min(xpos), min(xneg)))>0 && thresholdImg(ceil(j),ceil(max( min(xpos), min(xneg))))~=255)
%                 boolExtend=1;
%             end
%             
%         end
%         
%         
%     else
%         %         xpos=[xpos;max(xpos)+1];
%         %         yneg=[yneg;max(yneg)+p];
%         %
%         %         xneg=[xneg;max(xneg)+1];
%         %         ypos=[ypos;max(ypos)+p];
%         pause
%         boolExtend=0;
%     end
%     
%     
% end
% 
% plot(xpos,yneg,'-');
% plot(xneg,ypos,'-');



end