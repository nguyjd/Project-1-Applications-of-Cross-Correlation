clc
close ALL
clearvars

% Task 1

freq = (pi/15);

% x[n] = cos(pi/15 * n + phi), phi = 0
n = 1:200;
x_n = cos(freq*n);

% The random noise.
noisevals = 30*(rand(1, length(x_n)) - 0.5);

%----------Matched Filters--------%

% H[n], K = 10
k10 = 0:9; 
h10_n = cos(freq*k10);

% H[n], K = 20
k20 = 0:19; 
h20_n = cos(freq*k20);

% H[n], K = 40
k40 = 0:39; 
h40_n = cos(freq*k40);

% H[n], K = 80
k80 = 0:79; 
h80_n = cos(freq*k80);

%----------Matched Filters--------%

% Create a noisy signal from the random values.
x_n_noisy = x_n(n) + noisevals(n);

% Time reverse h[n]
h10_n = flip(h10_n);
h20_n = flip(h20_n);
h40_n = flip(h40_n);
h80_n = flip(h80_n);

% Compute the cross correlation
h10x_n_conv = conv(x_n_noisy, h10_n);
h20x_n_conv = conv(x_n_noisy, h20_n);
h40x_n_conv = conv(x_n_noisy, h40_n);
h80x_n_conv = conv(x_n_noisy, h80_n);

subplot(4, 1, 1), plot(h10x_n_conv)
subplot(4, 1, 2), plot(h20x_n_conv)
subplot(4, 1, 3), plot(h40x_n_conv)
subplot(4, 1, 4), plot(h80x_n_conv)