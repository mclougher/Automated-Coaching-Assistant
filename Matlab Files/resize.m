function [ newImg ] = resize( img )
%UNTiTLED Summarcolumns of this function goes here
%   Detailed erowsplanation goes here

    rows=496;
    columns=.75*rows;  
    newImg=zeros(columns,rows,3);
   
    for i=1:columns
        for j=1:rows
            for k=1:3
                newImg(i,j,k)=img(round(i*(480/columns)),round(j*(640/rows)),k);
            end
        end
    end

    newImg=newImg/255;




end

