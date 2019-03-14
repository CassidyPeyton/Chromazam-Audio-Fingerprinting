%main function

%Set the Signal to Noise Ratio
snr=15;

%Set the Length of the Input Recording
recordingLength = 15;

% Recording clip of song from user to be identified by the program
fs = 44100; %Sampling Rate
recorder = audiorecorder(fs,16,1); %Creating audio recording object to record clip of song to be identified
disp('Start Recording.')
recordblocking(recorder, recordingLength); %sets length of recroding to be 15 seconds long
disp('End Recording.');

% Store data in an array.
xo = getaudiodata(recorder);
%xo = xo(
 Ploting the waveform of recording
figure();
plot(xo);
title('Recorded Input');
ylabel('Amplitude');
xlabel('Time');

%Other Input Method
%start=2646000;
%sec5=220500;
%xo = audioread('HurrianHymn.mp3');

%xtemp=zeros(length(xo),1);
%for i = 1 : length(xo)
%   xtemp(i)=xo(i,1);
%end
%xo=xtemp;

%xo=xo(start:start+4*sec5);

%plot(xo)
%hold on
xo=awgn(xo,snr,'measured');%Adds the noise defined by the SNR
%plot(xo)
x = preprocessing(xo, fs);%Applies preprocessing to the input signal

%Finds the min Ed value for each song in the Database
ed(1) = findMinEd(x, y1);
ed(2) = findMinEd(x, y2);
ed(3) = findMinEd(x, y3);
ed(4) = findMinEd(x, y4);
ed(5) = findMinEd(x, y5);
ed(6) = findMinEd(x, y6);
ed(7) = findMinEd(x, y7);
ed(8) = findMinEd(x, y8);
ed(9) = findMinEd(x, y9);
ed(10) = findMinEd(x, y10);
ed(11) = findMinEd(x, y11);

for i = 1: 11
    if ed(i)==0
        ed(i)=1000;%catches error
    end
end

mined = min(ed);%Finds the closest match

%Prints out song corresponding to the lowest ED
if mined == ed(1)
    display('Ariana Grande');
elseif mined == ed(2)
    display('Autumn Leaves');
elseif mined == ed(3)
    display('Bach Invention 1');
elseif mined == ed(4)
    display('Guitar Etude');
elseif mined == ed(5)
    display('Hurrian Hymn');
elseif mined == ed(6)
    display('Propper Etude 22');
elseif mined == ed(7)
    display('Throat Singing');
elseif mined == ed(8)
    display('Trombone Solo');
elseif mined == ed(9)
    display('Trumpet Solo');
elseif mined == ed(10)
    display('Tuba Solo');
elseif mined == ed(11)
    display('Violin Sonata Bach');
else
    display('An error occured');%catches error
end

