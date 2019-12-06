function sigma = local_linear_combination(I, e)
Imax = max(max(I));
    Imin = min(min(I));
    ug = geom_average(I,e);
    ua = arthm_background(I);
    ug = ug(1,1);
    ua = ua(1,1);
    gamma = 2;
    sigma = zeros(size(I));
    for i=1:size(I,1)
        for j = 1: size(I,2)
            sigma(i,j) = ug + ((ua-ug)*((I(i,j) - Imin)^gamma)/(Imax - Imin));
        end
    end
end
