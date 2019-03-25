function [  ] = evaluateBack( fStart, start1, end1, showFig )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global A
global Sk
global fileNum
global shoulderArray
global hipArray
global totalAdvice;
warning='';

close all
F(end1-start1)=struct('cdata',[],'colormap',[]);
Ypix2Cm=2.3;
Xpix2Cm=.69;
backCurvature=zeros(end1-start1,1);

    estShoulderX=330+round(((A((shoulderArray(2)-1)*4+3+80*(Sk-1)+(fStart)*480)-2.85)*100)/Xpix2Cm);
    estShoulderY=240-round((A((shoulderArray(2)-1)*4+2+80*(Sk-1)+(fStart+10)*480))*100/Ypix2Cm);
      
    estHipX=round(((A((hipArray(1)-1)*4+3+80*(Sk-1)+fStart*480))*100)/Xpix2Cm);
    estHipY=235-round((A((hipArray(1)-1)*4+2+80*(Sk-1)+fStart*480))*100/Ypix2Cm);
    
  
    
    orig=imread('C:\Users\Michael\Pictures\com495 Processing\back0.png');
    image(orig)
    pause(.1)

for i=start1:end1;

    try
    
    img=imread(strcat('C:\Users\Michael\Dropbox\',num2str(fileNum),'-Side\Depth\',num2str(i),'_depth.bmp'));
 
    xArray=[];
    yArray=[];
 
    slope=((480-estShoulderY)-(480-estHipY))/(estShoulderX-estHipX);
    perpSlope=-slope^-1;
    
    if sqrt(((480-estShoulderY)-(480-estHipY))^2+(estShoulderX-estHipX)^2)<50
        if slope >-1
            estHipX=estHipX+40;
            estHipY=round(estHipY-40*slope);
        else 
            estHipX=round(estHipX+40*slope);
            estHipY=estHipY-40; 
        end
    end  
       
   j=1; 


    if abs(slope)<1
        while abs(single(img(round(estShoulderY-j*slope),estShoulderX+j,1))-single(img(round(estShoulderY-(j+1)*slope),estShoulderX+j+1,1)))<10 && abs(single(img(round(estShoulderY-j*slope),estShoulderX+j,2))-single(img(round(estShoulderY-(j+1)*slope),estShoulderX+j+1,2)))<10 && abs(single(img(round(estShoulderY-j*slope),estShoulderX+j,3))-single(img(round(estShoulderY-(j+1)*slope),estShoulderX+j+1,3)))<10 && estShoulderX+j<estHipX
            [xBack,yBack,img]=findBack(round(estShoulderX+j),round(estShoulderY-j*slope),perpSlope,img);
            xArray=[xBack;xArray];
            yArray=[yBack;yArray];
            j=j+1;
        end     
    else
        while abs(single(img(estShoulderY+j,round(estShoulderX+j*perpSlope),1))-single(img(estShoulderY+j+1,round(estShoulderX+(j+1)*perpSlope),1)))<10 && abs(single(img(estShoulderY+j,round(estShoulderX+j*perpSlope),2))-single(img(estShoulderY+j+1,round(estShoulderX+(j+1)*perpSlope),2)))<10 && abs(single(img(estShoulderY+j,round(estShoulderX+j*perpSlope),3))-single(img(estShoulderY+j+1,round(estShoulderX+(j+1)*perpSlope),3)))<10 && estShoulderY+j<=estHipY 
            [xBack,yBack,img]=findBack(round(estShoulderX+j*perpSlope),round(estShoulderY+j),perpSlope,img);
            xArray=[xBack;xArray];
            yArray=[yBack;yArray];
            j=j+1;
        end  
    end
    

    tempX=xArray;
    tempY=yArray;
   

    hold on
    if slope <-2
        x=yArray;
        y=xArray;
    else
        x = xArray;
        y = yArray;
    end
    
 
    p = polyfit(x,y,2);
    f = polyval(p,x);

    if slope<-2
       temp=x;
       x=f;
       f=temp;
    end
   
    if showFig
     
       for k=1:size(f)
        img(round(f(k)),round(x(k)),3)=255;
        img(round(f(k))+1,round(x(k))+1,3)=255;
        img(round(f(k))-1,round(x(k))+1,3)=255;
        img(round(f(k)),round(x(k)),2)=0;
        img(round(f(k))+1,round(x(k))+1,2)=0;
        img(round(f(k))-1,round(x(k))+1,2)=0;
        img(round(f(k)),round(x(k)),1)=0;
        img(round(f(k))+1,round(x(k))+1,1)=0;
        img(round(f(k))-1,round(x(k))+1,1)=0;
       end
%     figure
%     image(img)
              
    end
   
    newImg=resize(img);
    F(i-start1+1)=im2frame(newImg);

    
    slope1=(480-f(size(f,1))-(480-f(1)))/(x(size(x,1))-x(1));
    hypo=0;
    xPix=0;
    yPix=0;
    k=1;
    length=15;
    
    while hypo<length

        if slope1>1
            yPix=k;
            xPix=round(-k*slope1);
            hypo=sqrt(xPix*xPix+yPix*yPix);
            k=k+1;
        elseif slope1<-1
            yPix=k;
            xPix=round(-k*slope1);
            hypo=sqrt(xPix*xPix+yPix*yPix);
            k=k+1;
        else
            slope2=slope1^-1;
            xPix=k;
            yPix=round(-k*slope2);
            hypo=sqrt(xPix*xPix+yPix*yPix);
            k=k+1;
        end
    end
    
    
    if xPix>length+5
      xPix=length+5;
    end
  
    if xPix<-(length+5)
        xPix=-(length+5);
    end
    
    if yPix>length+5
        yPix=length+5;
    end
  
    if yPix<-(length+5)
        yPix=-(length+5);
    end
  
 
    dist=40;

    if slope1>=0
        midX=(min(x)+max(x))/2+xPix;
        midY=(min(f)+max(f))/2-yPix;
    else
        midX=(min(x)+max(x))/2-xPix;
        midY=(min(f)+max(f))/2+yPix;
    end        
    
    
    if slope1>1
        estShoulderX=midX-dist*slope1^-1;
        estShoulderY=midY-dist;

        estHipX=midX+dist*-slope1^-1;
        estHipY=midY+dist;
        elseif slope1<-1
        estShoulderX=midX+dist*slope1^-1;
        estShoulderY=midY-dist;
 
        estHipX=midX-dist*slope1^-1;
        estHipY=midY+dist; 
        else
        estShoulderX=midX-dist;
        estShoulderY=midY+dist*slope1;

        estHipX=midX+dist;
        estHipY=midY-dist*slope1;

    end

   estShoulderX=round(estShoulderX);
   estShoulderY=round(estShoulderY);
   estHipX=round(estHipX);
   estHipY=round(estHipY);
   
   if estShoulderX==estHipX
       estShoulderX=estShoulderX-1;
   end

    backCurvature(i)=p(1);
      
    catch
        warning=sprintf('\n(Note that either the weight has interfered with our estimates here or you may be moving too quickly):\n');
        F(i-start1:end1-start1)=[];
        break
    end
end


    backCurvature(backCurvature==0)=[];

    if abs(mean(backCurvature))>.005
        advice=sprintf('\nMake sure to keep your back straight.\n');
    else
        advice=sprintf('\nYour back looks nice and straight!\n');
    end
   
    advice=strcat(advice,warning);
    totalAdvice=strcat(totalAdvice,advice);
    
    choice = 2;
    while choice==2
        movie(F,1,30)
        choice = menu(advice,'See Feedback Summary.','Replay Clip!');
    end
   
end

