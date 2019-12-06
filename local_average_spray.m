function sigma = local_average_spray(I, step, e)
 kernel = spray_creation(step);
    avg = conv2(I,kernel,'same');
    div = max(max(avg));
    avg = avg/div;
    I_padded = padarray(I,[step,step],'replicate','both');
    sigma = zeros(size(I));
    for i=step+1:size(I_padded,1)-step
        for j = step+1:size(I_padded,2)-step
            sigma(i-step,j-step) = avg(i-step,j-step)*arthm_background(I_padded(i-step:i+step,j-step:j+step)) + (1-avg(i-step,j-step))*geom_average(I_padded(i-step:i+step,j-step:j+step),e);
        end
    end
end