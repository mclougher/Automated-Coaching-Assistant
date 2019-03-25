function [  ] = evaluate( frameArray,slopeArray )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


%Evaluate Speed
speedArray=[];

frameArray=frameArray-min(frameArray);
frameArray=frameArray(1:end-1);

for j=1:size(slopeArray,2)
    for i=1:size(slopeArray,1)-1
        speedArray(i,j)=abs(slopeArray(i,j)-slopeArray(i+1,j));
    end
end

figure

plot(frameArray,speedArray(:,1),frameArray,speedArray(:,2));
title('Speed of Motion');
xlabel('Frame Number');
ylabel('Change in Slope Angle');
axis([min(frameArray) max(frameArray) -1 1.5])



%Evaluate Symmetry for lat raises
symmetryArray=abs(slopeArray);
frameArray=[max(frameArray)+1;frameArray];

figure

plot(frameArray,symmetryArray(:,1),frameArray,symmetryArray(:,2));
title('Symmetry of Motion');
xlabel('Frame Number');
ylabel('Absolute Value of Slope Angle');
axis([min(frameArray) max(frameArray) -1 5])


%Evaluate Range of Motion

figure

plot(frameArray,slopeArray(:,1),frameArray,slopeArray(:,2));
title('Range of Motion');
xlabel('Frame Number');
ylabel('Slope Angle');
axis([min(frameArray) max(frameArray) -2 1.5])




end

