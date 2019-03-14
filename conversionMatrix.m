function [C] = conversionMatrix(M, fs)
% Find a conversion matrix to convert an STFT spectrum into a chroma spectrum
%
% Input:
% - M    : Number of frequency bins of the spectrum
% - fs   : Sampling rate of the audio signal
%
% Output:
% - C    : Conversion matrix with dimensionality of 12 * M
fbase = 110;

C = zeros(12,M);
for i = 1: 30
    for j = 1 : 12
        
        freq = (((2)^(i-1))*fbase)*2^((j-1)/12);
        note = 12*log2(freq/440)+69;
        rnote = round(note);
        
        freqm = 2^((rnote-69)/12)*(440);
        binNum = freqm *(M)/(fs/2);
        binNum = round(binNum);
        
        freqMin = 2^((rnote-69-.5)/12)*(440);
        freqMax = 2^((rnote-69+.5)/12)*(440);
        
        binNumMin = freqMin *(M)/(fs/2);
        binNumMax = freqMax *(M)/(fs/2);
        
        binNumMin = round(binNumMin);
        binNumMax = round(binNumMax);
        
        if binNum > (M-1)
            break;
        end
        
        if freqm > fs/2
           break;
        end
        
        if binNumMin == binNumMax
            C(j,binNum+1)=1;
        else
            for k = binNumMin+1 : binNumMax
                C(j,k+1)=1;
            end
            
        end
    end
end

%imagesc(C);

end



