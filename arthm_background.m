function s = arthm_background(img)
% Calculation of the arithmetic average of a region
% Inputs:   img = A region of the image
% Outputs:  s = The arithmetic average of that region
    [r,c] = size(img);
    s = sum(sum(img))/(r*c);
end