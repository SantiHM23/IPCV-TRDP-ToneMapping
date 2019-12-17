function s = geom_average(img,e)
% Calculation of the geometric average of a region
% Inputs:   img = A region of an image
%           e = Small constant in order to avoid zero values
% Outputs:  s = The geometric average of the region
    [r,c]=size(img);
    N=r*c;
    img = img+e;
    s = exp(sum(sum(log(img)))/N);
end