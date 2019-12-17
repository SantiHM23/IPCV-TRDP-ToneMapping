function sigma = local_average(I,step,e)
% Application of the arithmetic or the geometric averaging in a region
% depending on its mean value
% Inputs:   I = A channel of an image
%           step = Size of the kernel
%           e = Small constant in order to avoid zero values
% Outputs:  sigma = The channel with the locally calculated averages

%Arithmetic average of the full channel
threshold = sum(sum((I)))/(size(I,1)*size(I,2));

 for i = 1:step:size(I,1)
     for j = 1: step:size(I,2)
         if sum(sum(I(i:i+step-1,j:j+step-1))) >threshold
             %Apply arithmetic average when the mean in the region is
             %greater than the threshold
            sigma(i:i+step-1,j:j+step-1) = arthm_background(I(i:i+step-1,j:j+step-1));
         else
             %Apply geometric average when the mean in the region is
             %smaller than the threshold
            sigma(i:i+step-1,j:j+step-1) = geom_average(I(i:i+step-1,j:j+step-1),e);
         end
     end
 end
end


