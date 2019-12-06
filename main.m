
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lab
clc; clear all; close all;

img = hdrread('tinterna.hdr');
figure(1)
imshow(img);
img = rgb2lab(img);
img_average = img;
img_geom = img;
img_local = img;
Rmax=100; % according to Edoardo (We think)
n = 0.7;
e = 0.0001;
step = 128;

%% Arithmetic Averaging in Lab
%I = img(1:1+step-1,1:1+step-1,:); // I was trying 
sigma = arthm_background(img(:,:,1));
R(:,:,1) = img(:,:,1).^n./(img(:,:,1).^n+sigma.^n); % what function to use for sigma
R(:,:,1) = R(:,:,1)*Rmax;
img_average(:,:,1)= R(:,:,1);
img_average = lab2rgb(img_average);
figure(2)
imshow(img_average);
%% Geometric Averaging in Lab
sigma_g = geom_average(img(:,:,1),e);
R(:,:,1) = img(:,:,1).^n./(img(:,:,1).^n+sigma_g.^n); % what function to use for sigma
R(:,:,1) = R(:,:,1)*Rmax;
img_geom(:,:,1)= R(:,:,1);
img_geom = lab2rgb(img_geom);
figure(3)
imshow(img_geom);
%% Local Averageing in LAB

sigma_local = local_average(img(:,:,1),step,e);
R(:,:,1) = img(:,:,1).^n./(img(:,:,1).^n+sigma_local.^n); % what function to use for sigma
R(:,:,1) = R(:,:,1)*Rmax;
img_local(:,:,1)= R(:,:,1);
img_local = lab2rgb(img_local);
figure(4)
imshow(img_local);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RGB

clc; clear all; 
%close all;

img = hdrread('chairs.hdr');
figure()
imshow(img);
img_average = img;
img_geom = img;
img_local = img;
Rmax=100; % according to Edoardo (We think)
n = 0.7;
e = 0.0001; % It should be very small number. Bigger number changes the values of the image & geometric mean increases than arithmatic mean.
step = Divisor(img);
%step = 64;
step_spray = min(size(img,1),size(img,2));
%% Arithmetic average RGB

for i =1:size(img,3)
    sigma1 = arthm_background(img(:,:,i));
    R(:,:,i) = img(:,:,i).^n./(img(:,:,i).^n+(sigma1.^n)); % what function to use for sigma
    img_average(:,:,i)= R(:,:,i);
end
 figure
 imshow(img_average);
%% Geometric averaging with RGB

for i =1:size(img,3)
sigma_g = geom_average(img(:,:,i),e);
R(:,:,i) = img(:,:,i).^n./(img(:,:,i).^n+(sigma_g.^n)); % what function to use for sigma
img_geom(:,:,i)= R(:,:,i);
end
figure
imshow(img_geom);
%% Local averaging with RGB Spray
t = cputime;
for i =1:size(img,3)
sigma_local{i} = local_average_spray(img(:,:,i),step_spray,e);
R(:,:,i) = img(:,:,i).^n./(img(:,:,i).^n+sigma_local{i}.^n); % what function to use for sigma
img_local_spray(:,:,i)= R(:,:,i);
%img_local = lab2rgb(img_local);
end
figure()
imshow(img_local_spray);
finalt = cputime-t;
%% Local linear averaging with RGB
for i =1:size(img,3)
sigma_local{i} = local_linear_combination(img(:,:,i),e);
R(:,:,i) = img(:,:,i).^n./(img(:,:,i).^n+sigma_local{i}.^n); % what function to use for sigma
img_local_linear(:,:,i)= R(:,:,i);
%img_local = lab2rgb(img_local);
end
figure()
imshow(img_local_linear);
%% Local convex averaging with RGB
for i =1:size(img,3)
sigma_local{i} = local_convex(img(:,:,i),step,e);
R(:,:,i) = img(:,:,i).^n./(img(:,:,i).^n+sigma_local{i}.^n); % what function to use for sigma
img_local_conv(:,:,i)= R(:,:,i);
%img_local = lab2rgb(img_local);
end
figure()
imshow(img_local_conv);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HSV
clc; clear all; close all;

img = hdrread('tinterna.hdr');
figure(1)
imshow(img);
img = rgb2hsv(img);
%img_average = img;
img_geom = img;
img_local = img;
Rmax=100; % according to Edoardo (We think)
n = 0.7;
e = 0.0001;
step = Divisor(img);
%% Arithmetic Averaging in HSV
sigma = arthm_background(img(:,:,3));
R(:,:,3) = img(:,:,3).^n./(img(:,:,3).^n+sigma.^n); % what function to use for sigma
R(:,:,3) = R(:,:,3);
img_average(:,:,3)= R(:,:,3);
img_average = hsv2rgb(img_average);
figure(2)
imshow(img_average);
%% Geometric Averaging in HSV
sigma_g = geom_average(img(:,:,3),e);
R(:,:,3) = img(:,:,3).^n./(img(:,:,3).^n+sigma_g.^n); % what function to use for sigma
R(:,:,3) = R(:,:,3);
imgg(:,:,3)= R(:,:,3);
imgg = hsv2rgb(imgg);
figure(3)
imshow(imgg);

%% Local Averageing in HSV

sigma_local = local_average(img(:,:,3),step,e);
R(:,:,3) = img(:,:,3).^n./(img(:,:,3).^n+sigma_local.^n); % what function to use for sigma
R(:,:,3) = R(:,:,3);
img_l(:,:,3)= R(:,:,3);
img_l = hsv2rgb(img_l);
figure(1)
imshow(img_l);