function main_Part2(Sound)
%This function decodes the sound (DTMF array) taken as an input and returns the
%corresponding telephone number
    L = 400;
    decoded = []; %Empty array for the telephone number to be returned
    frequencies = [697 770 852 941 1209 1336 1447];
    
    soundLength = floor(8000*0.2);
    pauseLength = floor(8000*0.05);
    totLength = soundLength + pauseLength;
    numberOfSounds = length(Sound)/totLength;
    
    filters = createFilter();
    for i = 0:numberOfSounds
        %Iterates over all the signals and adds the right digit to the decoded array
        result = [];
        startTime = i*totLength+1;
        endTime = i*totLength + soundLength;
        tone = Sound(startTime:endTime);
        for j =1:7
            %Sends the signals trough the filters to find the right frequency
            Y = filter(filters(j,1:L-1),1,tone);
            if max(Y) > 0.5
                result = [result; j];
            end
        end
        number = createNumber(frequencies(result(1))+frequencies(result(2)));
        decoded = [decoded number];
    end
    decoded
end



