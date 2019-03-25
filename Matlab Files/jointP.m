function [  ] = jointP( depth_start, depth_end, fileNum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


global A;
global Sk;

global jointArray;
global elbowArray;
global wristArray;
global handArray;
global kneeArray;
global feetArray;
global shoulderArray;
global hipArray;


% 
% pic=imread('C:\KinectData\stillTestSide2_5deg\Depth\180_depth.bmp');
% figure
% image(pic)
% line([0,680],[95,95]);
% 
% 
% pic2=imread('C:\KinectData\stillTestFront2_5deg\Depth\143_depth.bmp');
% figure
% image(pic2)
% line([0,680],[95,95]);
% pause

% fid = fopen('C:\KinectData\5-Front\Skel\liTimeStamp.binary');
%B = fread(fid,'int64');
% fclose(fid);

%n = 5; % No. of columns of T
%BB = reshape(B, n,[]);
%T = permute(BB,[2,1]);

fid = fopen(strcat('C:\KinectData\',num2str(fileNum),'-Front\Skel\Joint_Position.binary'));
A = fread(fid,'float');
fclose(fid);
%jointNumber = 20;
%tracks = 6;
%AAAA = reshape(A, 4,jointNumber,tracks,[]);
%SkelJoint = permute(AAAA,[1,2,4,3]);

i=1;
    while A(i)==0 
        i=i+1;
    end    
    Sk=ceil(mod(i,480)/80);



%Convert Depth Frame to Skeleton Frame
skel_start=depth_start*480;
skel_end=depth_end*480;



allJoints=false;
elbows=true;
wrists=false;
hands=true;
knees=true;
shoulders=true;
hips=true;
feet=true;





close all
hold on




if ~allJoints
    if elbows
        jointArray=elbowArray;
        for i=1:size(jointArray)
            plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), '-o');
        end
    end
     if wrists
        jointArray=wristArray;
        for i=1:size(jointArray)
            plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'r-o');
        end
     end
     if hands
        jointArray=handArray;
        for i=1:size(jointArray)
            plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'g-o');
        end
     end
    if knees
        jointArray=kneeArray;
        for i=1:size(jointArray)
            plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'b-o');
        end
    end
    if shoulders
        jointArray=shoulderArray;
        for i=1:size(jointArray)
            plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'r-o');
        end
    end
    if hips
        jointArray=hipArray;
        for i=1:size(jointArray)
            plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'r-x');
        end
    end
    if feet
        jointArray=feetArray;
        for i=1:size(jointArray)
            plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'y-o');
        end
    end
else
    
% Plot All Joints:
    for i=1:20;
        plot(A((i-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((i-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), '-o');
    end
end

% % %Plot All Joints in 3d:
%     for i=1:20;
%         plot3(A((i-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((i-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), A((i-1)*4+3+80*(Sk-1)+skel_start:480:skel_end));
%     end
% end



axis([-1, 1, -1.5, 1.5]); 



end

