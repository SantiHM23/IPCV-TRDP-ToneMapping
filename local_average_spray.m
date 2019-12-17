function sigma = local_average_spray(I, step, e)
% Compute the convex combination of arithmetic and geometric mean with sprays
% Inputs:   I = A channel of the image
%           step = The size of the kernel
%           e = Small constant in order to avoid zero values
% Outputs:  sigma = Channel modified by the sprays

    %Create the appropiate spray kernel, convolve the image with it and
    %normalize the obtained convolved image
    kernel = spray_creation(step);
    avg = conv2(I,kernel,'same');
    div = max(max(avg));
    avg = avg/div;
    
    %Mirror padding of the image in order to use the kernel
    I_padded = padarray(I,[step,step],'replicate','both');
    sigma = zeros(size(I));
    
    %Apply the kernel on the padded image
    for i=step+1:size(I_padded,1)-step
        for j = step+1:size(I_padded,2)-step
            %Convex combination, where the parameter "avg(i,j)" is the
            %value of the pixel of the convolved image
            sigma(i-step,j-step) = avg(i-step,j-step)*arthm_background(I_padded(i-step:i+step,j-step:j+step)) + (1-avg(i-step,j-step))*geom_average(I_padded(i-step:i+step,j-step:j+step),e);
        end
    end
end