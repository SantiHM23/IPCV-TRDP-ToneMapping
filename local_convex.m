function sigma = local_convex(I, step, e)
% Calculate the convex combination of the arithmetic and geometric means
% Inputs:   I = A channel of the image
%           step = The size of the kernel
%           e = Small constant in order to avoid zero values
% Outputs:  sigma = Channel modified with the convex combination

%Option 1: No convolution is applied to the original image, just the
%formula directly
    %Normalization of the input channel
    I = I/(max(max(I)));
    %Obtention of the needed parameters for the formulation
    ug = geom_average(I,e);
    ua = arthm_background(I);
    sigma = zeros(size(I));
    for i=1:size(I,1)
        for j = 1: size(I,2)
            %Formula of the convex combination
            sigma(i,j) = (1-I(i,j))*ug + (I(i,j))*ua;
        end
    end
    
%Option 2: Kernel based convex combination, in which we convolve the
%original image with a kernel of size step completely filled with ones
%     kernel = ones(step,step);
%     avg = conv2(I,kernel,'same');
%     div = max(max(avg));
%     avg = avg/div;
%     I_padded = padarray(I,[step,step],'replicate','both');
%     sigma = zeros(size(I));
%     for i=step+1:size(I_padded,1)-step
%         for j = step+1:size(I_padded,2)-step
%             sigma(i-step,j-step) = avg(i-step,j-step).*arthm_background(I_padded(i-step:i+step,j-step:j+step)) + (1-avg(i-step,j-step)).*geom_average(I_padded(i-step:i+step,j-step:j+step),e);
%         end
%     end
end