clc
close ALL
clearvars
 
red_pixels_file = load('red_pixel_values.mat');
red_pixels = red_pixels_file.red_pixel_values;
 
% Frequency ranging from 1hz to 2hz
freq = (1:0.2:2)*2*pi;
discrete_freq = freq*(1/30);
 
% The matched filters
n = -50:50;
h_0 = sin(discrete_freq(1)*n);
h_1 = sin(discrete_freq(2)*n);
h_2 = sin(discrete_freq(3)*n);
h_3 = sin(discrete_freq(4)*n);
h_4 = sin(discrete_freq(5)*n);
h_5 = sin(discrete_freq(6)*n);
 
% Plotting the matched filters
figure(1)
hold on
stem(h_0);
stem(h_1);
stem(h_2);
stem(h_3);
stem(h_4);
stem(h_5);
title("Matched Filters")
xlabel("Input: n")
ylabel("Output Values") 
legend("h_0[n] 1 Hz","h_1[n] 1.2 Hz","h_2[n] 1.4 Hz" ...
,"h_3[n] 1.6 Hz","h_4[n] 1.8 Hz","h_5[n] 2 Hz")
hold off
 
% Time Reverse h[n]
h_0 = fliplr(h_0);
h_1 = fliplr(h_1);
h_2 = fliplr(h_2);
h_3 = fliplr(h_3);
h_4 = fliplr(h_4);
h_5 = fliplr(h_5);
 
% Compute the cross correlation
h0red_conv = conv(red_pixels, h_0, 'valid');
h1red_conv = conv(red_pixels, h_1, 'valid');
h2red_conv = conv(red_pixels, h_2, 'valid');
h3red_conv = conv(red_pixels, h_3, 'valid');
h4red_conv = conv(red_pixels, h_4, 'valid');
h5red_conv = conv(red_pixels, h_5, 'valid');
 
% Plot the cross correlation
figure(2)
hold on
stem(h0red_conv), stem(h1red_conv), stem(h2red_conv), stem(h3red_conv)
stem(h4red_conv)
stem(h5red_conv)
title("Cross Correleation of the red pixel signal and H_i[n]")
legend("Pixel * h_0[-n]", "Pixel * h_1[-n]", "Pixel * h_2[-n]"...
,"Pixel * h_3[-n]", "Pixel* h_4[-n]", "Pixel * h_5[-n]");
hold off
 
% Finding the best guess.
for freq = 0.8:0.001:.878
 
    discrete_freq = freq*(1/30)*2*pi;
    h = sin(discrete_freq*n);
    red_conv = conv(red_pixels, fliplr(h), 'valid');
    
    figure(3)
    plot(red_conv)
    ylim([-80 80])
    title("Frequency: " + string(freq) + " Hz")
    
    
    pause(.01)
 
end
