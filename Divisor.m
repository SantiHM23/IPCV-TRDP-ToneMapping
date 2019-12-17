function G = Divisor(img)
% Function devoted to find the Greatest Common Divisor of the sides of the
% image, in order to apply the kernel based approach
% Inputs:   img = An image
% Outputs:  G = The Greatest Common Divisor of the two dimensions
    mat = img(:,:,1);
    [r,c] = size(mat);
    [G,~,~] = gcd(r,c);
end