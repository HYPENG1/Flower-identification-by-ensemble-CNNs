clear all;close all;clc;
fileFolder=fullfile('segmim');
dirOutput=dir(fullfile(fileFolder,'*.jpg'));

for i = 1 : 8189
    local_segmim = strcat('segmim/'  ,dirOutput(i).name);
    local_dwt_segmim = strcat('dwt_segmim/' ,dirOutput(i).name);
    pict=imread(local_segmim);
    
    pict = rgb2gray(pict);
    %imshow(mat2gray(pict))      %��ʾ�Ҷ�ͼ
    
	[cA,cH,cV,cD]=dwt2(pict,'haar');           %1��С���任
    
	%subplot(2,2,1);     imshow(mat2gray(cA))   
	%subplot(2,2,2);     imshow(mat2gray(cH))    
	%subplot(2,2,3);     imshow(mat2gray(cV))   
	%subplot(2,2,4);     imshow(mat2gray(cD)) 
    
    c_output = cV + cD;
    c_output = mat2gray(c_output);
    %figure();
    %imshow(c_output)      %��ʾ�Ҷ�ͼ
    
    
    imwrite(c_output,local_dwt_segmim);
end

