function s = geom_average(img,e)

[r,c]=size(img);
N=r*c;
img = img+e;
s = exp(sum(sum(log(img)))/N);
%sigma = ones(r,c).*s;
end