# Project 1: Applications of Cross Correlation

The project uses cross-correlation to detect a signal in the noise.

The detected signal is estimated by using a template signal and cross-correlating it with the input signal. To cross-correlate the signal, the template signal is time-reversed and is convolved with the input signal.

The maxima observed in the convolved signal are when the detected signal and the noise are aligned. From there, we can recover the signal.

This project is inspired from [Michael Rubinstein Ted Talk](https://www.ted.com/talks/michael_rubinstein_see_invisible_motion_hear_silent_sounds).

<b>Project Members</b>
<ul>  
  <li>Jonathon Nguyen</li>
</ul>

# Requirements

The matlab version is developed on R2021a in Windows.
- Matlab R2021a
- Windows 10 OS

# Features

- [x] Detect the phase and period of a sinusoid in a noisy signal.
- [x] Detect the frequency of a sinusoid in a noisy signal.
- [x] Process a video image to find a frequency of a signal.

# Links

- [Project Boards](https://github.com/nguyjd/Project-1-Applications-of-Cross-Correlation/projects) 

# Legal

The ".mat" files reference in the code was not created by me. I do not have permission to upload the files.
