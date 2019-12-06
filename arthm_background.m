function s = arthm_background(img)

[r,c] = size(img);
s = sum(sum(img))/(r*c);
%mat = ones(r,c);
%sigma = mat.*s; 
%imshow(sigma);
end