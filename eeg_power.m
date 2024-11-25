% Load or generate EEG signal
% Replace with your own EEG signal as 'eeg_signal' and 'sampling_rate'
% Example: Generating a synthetic EEG signal
Fs = 256; % Sampling rate (Hz)
T = 1/Fs; % Sampling interval
L = 1024; % Number of samples
t = (0:L-1)*T; % Time vector
eeg_signal = sin(2*pi*10*t) + 0.5*sin(2*pi*20*t) + randn(size(t))*0.1; % Synthetic EEG signal

% Compute the Fourier Transform of the EEG signal
n = length(eeg_signal); % Number of samples
fft_signal = fft(eeg_signal); % Compute FFT

% Compute the two-sided spectrum and then the single-sided spectrum
P2 = abs(fft_signal/n); % Two-sided spectrum
P1 = P2(1:n/2+1); % Single-sided spectrum
P1(2:end-1) = 2*P1(2:end-1); % Account for symmetry

% Compute frequency axis
frequencies = Fs*(0:(n/2))/n;

% Plot the Power Spectral Density (PSD)
figure;
plot(frequencies, P1.^2); % Power is the square of the amplitude
xlabel('Frequency (Hz)', 'FontSize', 12);
ylabel('Power', 'FontSize', 12);
title('Power Distribution of EEG Signal', 'FontSize', 14);
grid on;
xlim([0, Fs/2]); % Limit to Nyquist frequency
