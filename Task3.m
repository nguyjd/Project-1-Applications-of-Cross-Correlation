clc
close ALL
clearvars
 
video = load('rgb_video_values.mat');
red_pixels_file = load('red_pixel_values.mat');
x_n = video.imageStack_uint8;
 
% The matched filter
n = -50:50;
discrete_freq = 0.878*(1/30)*2*pi;
h_n = sin(discrete_freq*n);
 
% Time Reverse h[n]
h_n = fliplr(h_n);
 
% Plot the cross-correlation 
figure(1)
plot(conv(red_pixels_file.red_pixel_values, h_n, "same"))
title("Cross Correleation of the red pixel signal and H[n]")
 
% Compute the cross correlation
y_n = conv2(x_n, h_n, 'same');
 
alpha = 1.8;
 
% Code provided to reshape the matrix into a image.
rgb_images = reshape(x_n, [video.rows, video.cols, 3, video.num_frames]);
rgb_processed = reshape(y_n, [video.rows, video.cols, 3, video.num_frames]);
rgb_processed = rgb_images + uint8(alpha * rgb_processed);
 
% Code provided to see the output video. 
for frame = 1:video.num_frames
    figure(2)
    subplot(1,2,1), imshow(rgb_images(:,:, :,frame),'InitialMagnification', 'fit')
    xlabel('original image');
    framestr = sprintf('processed image %d',frame);
    subplot(1,2,2), imshow(rgb_processed(:,:,:,frame),'InitialMagnification', 'fit')
    xlabel(framestr);
    pause(1/30);
end
 
minframe = 238;
maxframe = 153;
figure(3), subplot(2,2,1), imshow(rgb_images(:,:,:,minframe));
xlabel('Original min image');
figure(3), subplot(2,2,2), imshow(rgb_processed(:,:,:,minframe))
xlabel('Magnified min image');
figure(3), subplot(2,2,3), imshow(rgb_images(:,:,:,maxframe))
xlabel('Original max image');
figure(3), subplot(2,2,4), imshow(rgb_processed(:,:,:,maxframe))
xlabel('Magnified max image');
