function [ posArray, posArray2 ] = removeOutliers2( posArray, posArray2 )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% line([mean(posArray),mean(posArray)],[-1.5,1.5]);


size(posArray);
mean1=mean(posArray);

while abs(max(posArray)-mean(posArray))>20
    [~,idx] = max(posArray);
    posArray(idx) = [];
    posArray2(idx) = [];
end

while abs(min(posArray)-mean(posArray))>20
    [~,idx] = min(posArray);
    posArray(idx) = [];
    posArray2(idx) = [];
end

% pause
% line([mean(posArray),mean(posArray)],[-1.5,1.5]);

% size(posArray);
% mean(posArray)-mean1;

end

