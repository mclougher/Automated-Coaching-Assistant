function [ output_args ] = aviTest( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% filename='C:\Users\Michael';
% aviobj=avifile(filename);
% 
%       img=imread(strcat('C:\Users\Michael\Dropbox\',num2str(5),'-Side\Depth\',num2str(i),'_depth.bmp'));
% 
% frame=
% 
% aviobj=addframe(aviobj,F)
% 




aviobj = avifile('example_1.avi', 'compression', 'none', 'fps', 30);  
for i=1:8  
    %generating the filenames  
    img=imread(strcat('C:\Users\Michael\Dropbox\',num2str(5),'-Side\Depth\',num2str(i),'_depth.bmp'));
%     filename = strcat('Masks/',int2str(i),'.bmp');   
%     I = imread(filename);  
    aviobj = addframe(aviobj,img);                                                 
end  
aviobj = close(aviobj);   


end

