function [  ] = main( file )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


    global A;
    global Sk;
    global movieIndex;
    movieIndex=0;


    global elbowArray;
    global wristArray;
    global handArray;
    global kneeArray;
    global feetArray;
    global shoulderArray;
    global hipArray;
    global fileNum;
    global totalAdvice;

    fileNum=file;
    elbowArray=[6;10];
    wristArray=[7;11];
    handArray=[8;12];
    kneeArray=[14;18];
    feetArray=[16;20];
    shoulderArray=[3;5;9];
    hipArray=[1;13;17];
    totalAdvice='';
    pix2Cm=.259;
    estX=320;
    estY=415;
    yTrack=estY;
    frontStart=130;
    sideStart=200;
    frames=1;


    orig=imread('C:\Users\Michael\Pictures\com495 Processing\sync.png');
        image(orig)
        pause(.1)

    fid = fopen(strcat('C:\KinectData\',num2str(fileNum),'-Front\Skel\Joint_Position.binary'));
    A = fread(fid,'float');
    fclose(fid);

    i=1;
        while A(i)==0 
            i=i+1;
        end    
        Sk=ceil(mod(i,480)/80);

    close all
    correctFirst=1;
    trackCount=0;

    %Find Starting Side Frame
    sideCount=1;
    while max(yTrack)-yTrack(sideCount)<5 && abs(max(yTrack)-mean(yTrack))<10


        img=imread(strcat('C:\Users\Michael\Dropbox\',num2str(fileNum),'-Side\Depth\',num2str(trackCount+sideStart),'_depth.bmp'));

        [estX,estY]=findWeight(estX,estY,img,0,0,1,2);
        if trackCount>5
            yTrack=[yTrack;estY];
            sideCount=sideCount+1;
            if correctFirst
                yTrack(1)=[];
                correctFirst=0;
                sideCount=sideCount-1;
            end
        end
        trackCount=trackCount+1;

    end

    sideStart=sideStart+sideCount;

    % Find Starting Front Frame
    frontCount=1;

    %While hands far enough from bar or hands are going towards floor
    while  abs(estY-(240-round((A((handArray(1)-1)*4+2+80*(Sk-1)+(frontStart+frontCount)*480))*100/pix2Cm))>10) || A((handArray(1)-1)*4+2+80*(Sk-1)+(frontStart+frontCount)*480) < A((handArray(1)-1)*4+2+80*(Sk-1)+(frontStart+frontCount-15)*480)

        frontCount=frontCount+1;

    end

    frontStart=frontStart+frontCount;
    endCount=0;


    %Find end frame by looking at when bar has been on ground for just under one second
    while endCount<25;

        img=imread(strcat('C:\Users\Michael\Dropbox\',num2str(fileNum),'-Side\Depth\',num2str(frames+sideStart),'_depth.bmp'));

        [estX,estY]=findWeight(estX,estY,img,0,0,1,2);

        %When weight first moves up bias estimate upwards
        if frames<30
            estY=estY-10;
        end
        frames=frames+1;

        if abs(estY-mean(yTrack))<5 
            endCount=endCount+1;
        else 
            endCount=0;
        end

    end

    sideStart=sideStart+1;
    frontEnd=frontStart+frames;
    sideEnd=sideStart+frames;

    skel_start=frontStart*480;
    skel_end=frontEnd*480;


    %Calls to five main evaluation functions
    evaluateForearms(skel_start,skel_end);
    evaluateFeetWidth(skel_start,skel_end);
    trunkSpeed(frontStart,frontEnd)
    trackWeight(frontStart,sideStart,sideEnd,1);
    evaluateBack(frontStart,sideStart,sideEnd,1);

        h=msgbox(totalAdvice,'Summary:');
        uiwait(h)

    close all



end

