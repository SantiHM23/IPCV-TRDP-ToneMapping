function K = spray_creation(step)
%step = step/2;
R = 1;
A = rand(6500,1);
% Image = ceil(rand(500,500,3) * 255);
% Imrgb = uint8(Image);
%theta = A * 2 * 3.141592;
%pho = A * R;

distr = zeros(size(A,1), 2);  
% ix = ceil(size(A,1)/2);
% iy = ceil(size(A,2)/2);
ix = 1;
iy = 1;
K = zeros(step,step);

for k = 1:(size(A,1))
    
%     jx = ix+pho(k)*cos(theta(k)); %Angles in radians
%     jy = iy+pho(k)*sin(theta(k)); %Angles in radians
    roh = rand()*R;
    theta = rand()*2*pi;
    jx = ix+(log(1+roh)/log(2))*cos(theta);
    jy = iy+(log(1+roh)/log(2))*sin(theta);
    distr(k,1) = ceil((jx)*(step/2));
    distr(k,2) = ceil((jy)*(step/2));
    K(distr(k,1), distr(k,2)) = 1; %Just ones, or the number of times that they appear???
end

%scatter(distr(:,1),distr(:,2));
%imshow(K);
end
