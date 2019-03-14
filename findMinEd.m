function [ value ] = findMinEd( x, y )
edsum = 0;
ed = zeros (length(x),1);
for i = 1 : (length(y)-length(x))%increments starting position throughout the song
    B = y(i:length(x)+i);
    for j = 1 : length(x)%finds the euclidean distance
        edsum = (x(j)-B(j))^2 + edsum;
    end
    ed(i) = sqrt(edsum);
end
    value = min(ed);%Returns the smallest ED value found in the song

end

