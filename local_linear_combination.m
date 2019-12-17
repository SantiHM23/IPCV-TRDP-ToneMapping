function sigma = local_linear_combination(I, e, gamma)
% Calculation of the local linear combination of the arithmetic and
% geometric means
% Inputs:   I = A channel of the image
%           e = Small constant in order to avoid zero values
%           gamma = Integer greater than one in order to modify the linear
%           combination into a concave combination
% Outputs:  sigma = Modified channel by the linear combination

    %Obtention of the needed parameters for the formulation
    Imax = max(max(I));
    Imin = min(min(I));
    ug = geom_average(I,e);
    ua = arthm_background(I);
    sigma = zeros(size(I));
    for i=1:size(I,1)
        for j = 1: size(I,2)
            %Formula of the linear combination
            sigma(i,j) = ug + ((ua-ug)*((I(i,j) - Imin)^gamma)/(Imax - Imin));
        end
    end
end
