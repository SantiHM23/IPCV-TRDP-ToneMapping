function G = Divisor(img)
 mat = img(:,:,1);
 [r,c] = size(mat);
 [G,U,V] = gcd(r,c);
end