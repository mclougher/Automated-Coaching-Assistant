function [  ] = trunkSpeed( start1, end1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


global A;
global Sk;

global elbowArray;
global kneeArray;
global shoulderArray;
global hipArray;
global totalAdvice;

close all
    
    skel_start=start1*480;
    skel_end=end1*480;
    
    
    %Hips and Knees Speed
    hold on

    jointArray=shoulderArray;
    
    for i=1:size(jointArray)
        plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'r-x');
    end
    xlabel('x-position');
    ylabel('y-position');
    
   
    centerShoulderX=A((jointArray(1)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    centerShoulderY=A((jointArray(1)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);
    leftShoulderX=A((jointArray(2)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    leftShoulderY=A((jointArray(2)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);
    rightShoulderX=A((jointArray(3)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    rightShoulderY=A((jointArray(3)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);

    [centerShoulderX,centerShoulderY]=removeOutliers(centerShoulderX,centerShoulderY);
    [centerShoulderY,centerShoulderX]=removeOutliers(centerShoulderY,centerShoulderX);
    [leftShoulderX,leftShoulderY]=removeOutliers(leftShoulderX,leftShoulderY);
    [leftShoulderY,leftShoulderX]=removeOutliers(leftShoulderY,leftShoulderX);
    [rightShoulderX,rightShoulderY]=removeOutliers(rightShoulderX,rightShoulderY);
    [rightShoulderY,rightShoulderX]=removeOutliers(rightShoulderY,rightShoulderX);
    
    
    
    jointArray=elbowArray;
    
    for i=1:size(jointArray)
        plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'r-x');
    end
    
          
    axis([-1, 1, -1.5, 1.5]); 
    xlabel('x-position');
    ylabel('y-position');
    
    leftElbowX=A((jointArray(1)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    leftElbowY=A((jointArray(1)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);
    rightElbowX=A((jointArray(2)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    rightElbowY=A((jointArray(2)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);

    [leftElbowX,leftElbowY]=removeOutliers(leftElbowX,leftElbowY);
    [leftElbowY,leftElbowX]=removeOutliers(leftElbowY,leftElbowX);
    [rightElbowX,rightElbowY]=removeOutliers(rightElbowX,rightElbowY);
    [rightElbowY,rightElbowX]=removeOutliers(rightElbowY,rightElbowX);
    
    
    jointArray=hipArray;
    
    for i=1:size(jointArray)
        plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'g-x');
    end
    
   
    centerHipX=A((jointArray(1)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    centerHipY=A((jointArray(1)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);
    leftHipX=A((jointArray(2)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    leftHipY=A((jointArray(2)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);
    rightHipX=A((jointArray(3)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    rightHipY=A((jointArray(3)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);

    [centerHipX,centerHipY]=removeOutliers(centerHipX,centerHipY);
    [centerHipY,centerHipX]=removeOutliers(centerHipY,centerHipX);
    [leftHipX,leftHipY]=removeOutliers(leftHipX,leftHipY);
    [leftHipY,leftHipX]=removeOutliers(leftHipY,leftHipX);
    [rightHipX,rightHipY]=removeOutliers(rightHipX,rightHipY);
    [rightHipY,rightHipX]=removeOutliers(rightHipY,rightHipX);
    
    
    jointArray=kneeArray;
    
    for i=1:size(jointArray)
        plot(A((jointArray(i)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end), A((jointArray(i)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end), 'g-x');
    end
    
          
    axis([-1, 1, -1.5, 1.5]); 
    xlabel('x-position');
    ylabel('y-position');
    
    leftKneeX=A((jointArray(1)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    leftKneeY=A((jointArray(1)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);
    rightKneeX=A((jointArray(2)-1)*4+1+80*(Sk-1)+skel_start:480:skel_end);
    rightKneeY=A((jointArray(2)-1)*4+2+80*(Sk-1)+skel_start:480:skel_end);

    [leftKneeX,leftKneeY]=removeOutliers(leftKneeX,leftKneeY);
    [leftKneeY,leftKneeX]=removeOutliers(leftKneeY,leftKneeX);
    [rightKneeX,rightKneeY]=removeOutliers(rightKneeX,rightKneeY);
    [rightKneeY,rightKneeX]=removeOutliers(rightKneeY,rightKneeX);
    
    
    figure
    hold on    
    
    %Lower Body Plot
    plot(leftKneeX,leftKneeY,'g-x');
    plot(rightKneeX,rightKneeY,'g-x');
    plot(centerHipX,centerHipY,'g-x');
    plot(leftHipX,leftHipY,'g-x');
    plot(rightHipX,rightHipY,'g-x');
    
    
    %Trunk Plot
    plot(leftElbowX,leftElbowY,'r-x');
    plot(rightElbowX,rightElbowY,'r-x');
    plot(centerShoulderX,centerShoulderY,'r-x');
    plot(leftShoulderX,leftShoulderY,'r-x');
    plot(rightShoulderX,rightShoulderY,'r-x');
    

    axis([-1, 1, -1.5, 1.5]); 
    xlabel('x-position');
    ylabel('y-position');

    arrayY=zeros(end1-start1,1);
    arrayYT=zeros(end1-start1,1);
    arrayFrames=zeros(end1-start1,1);

       
    %Sumation of Y-positions
    for i=1:end1-start1
        sum=0;
        div=0;
        sumT=0;
        divT=0;
        
        %Lower Body
        if i<=size(leftKneeY,1)
            sum=sum+leftKneeY(i);
            div=div+1;
        end
        if i<=size(rightKneeY,1)
            sum=sum+rightKneeY(i);
            div=div+1;
        end
        if i<=size(centerHipY,1)
            sum=sum+centerHipY(i);
            div=div+1;
        end
        if i<=size(leftHipY,1)
            sum=sum+leftHipY(i);
            div=div+1;
        end
        if i<=size(rightHipY,1)
            sum=sum+rightHipY(i);
            div=div+1;
        end
               
        %Trunk
        if i<=size(leftElbowY,1)
            sumT=sumT+leftElbowY(i);
            divT=divT+1;
        end
        if i<=size(rightElbowY,1)
            sumT=sumT+rightElbowY(i);
            divT=divT+1;
        end
        if i<=size(centerShoulderY,1)
            sumT=sum+centerShoulderY(i);
            divT=divT+1;
        end
        if i<=size(leftShoulderY,1)
            sumT=sumT+leftShoulderY(i);
            divT=divT+1;
        end
        if i<=size(rightShoulderY,1)
            sumT=sumT+rightShoulderY(i);
            divT=divT+1;
        end

    arrayY(i)=sum/div;
    arrayFrames(i)=i;
    
    arrayYT(i)=sumT/divT;
        
    end
    
    Y=diff(arrayY);
    YT=diff(arrayYT);
    Y(end1-start1)=0;    
    YT(end1-start1)=0;
    size(Y);
    figure
    hold on
    plot(arrayFrames,arrayY,'r-*');
    plot(arrayFrames,arrayYT,'b-o');
    plot(arrayFrames,Y,'y-*');
    plot(arrayFrames,YT,'g-o');

    maxIndex=max(max(arrayY),max(arrayYT));
    axis([0, end1-start1, 1.3*min(arrayY), 1.3*maxIndex]);
    legend('*-=Lower Body Pos','-=Trunk Pos','*-Lower Body Speed','Trunk Speed');
       
    %Only look at when body is moving upwards
    trunkIndices=YT(:)<.01;
    lowerIndices=Y(:)<.01;
    
    upwardsTrunkSpeed=YT;
    upwardsLowerbodySpeed=Y;
    
    upwardsTrunkSpeed(trunkIndices)=NaN;
    upwardsLowerbodySpeed(lowerIndices)=NaN;
    
    %Cut out the last second of noise after stepping away from bar
    upwardsTrunkSpeed(size(arrayFrames,1)-30:size(arrayFrames,1))=NaN;
    upwardsLowerbodySpeed(size(arrayFrames,1)-30:size(arrayFrames,1))=NaN;
        
     
    if  mean(upwardsTrunkSpeed(~isnan(upwardsTrunkSpeed)))-mean(upwardsLowerbodySpeed(~isnan(upwardsLowerbodySpeed)))>.02
        advice=sprintf('\nMake sure not to move your torso faster than your hips and knees.');
    else
        advice=sprintf('\nGood speed of torso relative to your trunk.');     
    end

    
    totalAdvice=strcat(totalAdvice,advice);

    h=msgbox(advice,'Feedback:');   
    uiwait(h)

end

