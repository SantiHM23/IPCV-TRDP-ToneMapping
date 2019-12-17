function K = spray_creation(step)
% Generation of sprays
% Inputs:   step = Dimension of the future spray kernel
% Outputs:  K = Square kernel in which the generated spray is located

%Computation of the minimum number of points needed in the spray
n = ceil(step*step*0.015);
%Radius of the spray
R = 1;
%Random generation of the points that conform the spray
A = rand(n,1);
%Matrix that will store the x and y coordinates of each of the points of the spray
distr = zeros(size(A,1), 2);
%Centre of the radial spray
ix = 1;
iy = 1;
%Empty kernel where the spray will be located
K = zeros(step,step);

for k = 1:(size(A,1)) %For each point of the spray
    %Random generation of the roh and theta parameters
    roh = rand()*R;
    theta = rand()*2*pi;
    %Obtention of the coordinates of the point of the spray, in range [0,2]
    jx = ix+(log(1+roh)/log(2))*cos(theta);
    jy = iy+(log(1+roh)/log(2))*sin(theta);
    %Scaling of the point coordinates into the kernel size
    distr(k,1) = ceil((jx)*(step/2));
    distr(k,2) = ceil((jy)*(step/2));
    %Give a one value to the point that is represented in the kernel
    K(distr(k,1), distr(k,2)) = 1;
end

%scatter(distr(:,1),distr(:,2));
%imshow(K);
end
