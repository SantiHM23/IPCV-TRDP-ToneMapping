% function img = local_average()
% img = hdrread('tinterna.hdr');
% 
% figure(1)
% imshow(img);
% img = rgb2lab(img);
% S = qtdecomp({img(:,:,1),5});
% vals = qtgetblk(img,S,4);
% valmodes = zeros(size(vals));
% for blknum = 1:size(vals,3)
%     valmodes(:,:,blknum) = mode(vals(:,:,blknum),'all');
% end
% J = qtsetblk(I,S,4,valmodes)
% end
function sigma = local_average(I,step,e)
 
threshold = sum(sum((I)))/(size(I,1)*size(I,2));

 for i = 1:step:size(I,1)
     for j = 1: step:size(I,2)
         if sum(sum(I(i:i+step-1,j:j+step-1)))>threshold
            sigma(i:i+step-1,j:j+step-1) = arthm_background(I(i:i+step-1,j:j+step-1));
         else
            sigma(i:i+step-1,j:j+step-1) = geom_average(I(i:i+step-1,j:j+step-1),e);
         end
     end
 end
end


