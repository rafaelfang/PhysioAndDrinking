function [ scaledMat ] = scale( mat )
%SCALE Summary of this function goes here
%   Detailed explanation goes here
%     maxVal=max(mat);
%     minVal=min(mat);
%     scaledMat=(mat-minVal)./(maxVal-minVal);

scaledMat=9.8*mat/1000;

end

