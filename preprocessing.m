function [ y ] = preprocessing( x, fs )
%x and fs are collected in the main using audioread
%z is the acuracy vs time between 1 and 100

%convert to mono
xtemp=zeros(length(x),1);
for i = 1 : length(x)
   xtemp(i)=x(i,1);
end
x=xtemp;
%preprocessing 1: Take Chromagram
%s= spectrogram(x,1024 * 4,0,512, fs, 'yaxis');
%s = abs(real(s));
%[m,~] = size(s);

%Takes the FFT of signal
frameLen = 1024;
frameHop = 512;
zpr = 4;
fftLen = frameLen * zpr;
w = hamming(frameLen, 'periodic');
frameNum = floor((length(x) - frameLen)/frameHop);
s = zeros(fftLen/2+1,frameNum);
[m,~] = size(s);
for i = 1 :frameNum
    startp = (i-1)*frameHop+1;
    endp = startp + frameLen-1;
    windowed = x(startp:endp).*w;
    xmags = abs(fft(windowed,fftLen));
    
    s(:,i)=xmags(1:fftLen/2+1,:);
end
s = abs(real(s));

%Multiplies FFT by apropriate conversion matrix
C = conversionMatrix(m,fs);
chrom = C*s;
chrom = 20 * log10(chrom);%Log scale

figure();%Displays chromagram of the input
imagesc(chrom);
title('Chromagram of Input');
ylabel('Note Number');
xlabel('Frame');
%Preprocessing 2:Take largest value every x samples
A = max(chrom);
B=zeros(floor(length(A)),1);
for i = 1: floor(length(A))
    for j = 1:12
        if chrom(j,i) == A(i)
           B(i)=j; %Saves note value of most present note at each sample
        end
    end
end

%Preprocessing 3: Create Difference Array
y=zeros(length(B)-1,1);
for i=1:(length(B)-1)
    y(i)=B(i)-B(i+1);
    if y(i)<0 %Adds 12 if value is negative 
        y(i)=y(i)+12;
    end
end
end

