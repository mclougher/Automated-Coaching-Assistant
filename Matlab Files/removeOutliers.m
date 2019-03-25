function [ posArray, posArray2 ] = removeOutliers( posArray, posArray2 )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


size(posArray);

while abs((max(posArray)-mean(posArray))/std(posArray))>2.7
    [~,idx] = max(posArray);
    posArray(idx) = [];
    posArray2(idx) = [];
end

while abs((min(posArray)-mean(posArray))/std(posArray))>2.7
    [~,idx] = min(posArray);
    posArray(idx) = [];
    posArray2(idx) = [];
end


end

