fs = 44100;%declares sampling rate for all songs

%Reads audio files in database
[x1,~]=audioread('ArianaGrande.mp3');
[x2,~]=audioread('AutumnLeaves.mp3');
[x3,~]=audioread('BachInvention1.mp3');
[x4,~]=audioread('GuitarEtude.mp3');
[x5,~]=audioread('HurrianHymn.mp3');
[x6,~]=audioread('PopperEtude22.mp3');
[x7,~]=audioread('ThroatSinging.mp3');
[x8,~]=audioread('TromboneSolo.mp3');
[x9,~]=audioread('TrumpetSolo.mp3');
[x10,~]=audioread('TubaSolo.mp3');
[x11,~]=audioread('ViolinSonataBach.mp3');

%Preprocesses all audio files in database and saves results
y1 = preprocessing(x1,fs);
y2 = preprocessing(x2,fs);
y3 = preprocessing(x3,fs);
y4 = preprocessing(x4,fs);
y5 = preprocessing(x5,fs);
y6 = preprocessing(x6,fs);
y7 = preprocessing(x7,fs);
y8 = preprocessing(x8,fs);
y9 = preprocessing(x9,fs);
y10 = preprocessing(x10,fs);
y11 = preprocessing(x11,fs);
