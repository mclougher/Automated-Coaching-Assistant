function [  ] = addSlope( slope,firstTime )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if(firstTime)
    slopeArray=[];
end

slopeArray=[slope;slopeArray]

end

