function decodedNumber = main_part2(ToneGeneratedPart1)
    %% Variabler som brukes gjennom hele programmet
    
    Fs = 8000; % samplingsfrekvensen
    decodedNumber = []; % Telefonnummeret som vil bli returnert
    
    %% Fjerner pause delen i signalet
    
    toneLenght = Fs*0.2; %Lengden av en tone er samplefrekvens * tid
    pauseLenght = Fs*0.05; %Lengden av pausen er samplefrekvens * tid
    numbersToFilter = round(length(ToneGeneratedPart1)/(toneLenght + pauseLenght)); %Finner ut hvor mange nummer signalet best�r av
    toFilter = [];
    start = 1;
    for n = 1:numbersToFilter
        toFilter = [toFilter (ToneGeneratedPart1(start:start + toneLenght - 1))];
        start = start + toneLenght + pauseLenght;
    end
    
    %% Lager B�ndpassfiltrene som blir brukt til � identifisere tallene
    
    Frekvenser = [697 770 852 941 1209 1336 1477]; % De forskjellige frekvensene i bruk i DTMF
    L = 300; % Bredden p� b�ndet til b�ndpassfilteret
    n = 0:L-1; 
    filters = [];   
    for i = 1:length(Frekvenser)
        f0 = Frekvenser(i)/Fs; %Digital frekvens
        w0 = f0 * 2 * pi; %Vinkelfrekvens
        bk = (2 * cos(w0 * n)/L); % Amplitude
           
        filters  = [filters; bk];
        [h, w] = freqz(bk, 1, L);
        plot((w * Fs / (2 * pi)), abs(h));
        hold on
    end
    title('Filter');
    xlabel('Frekvens');
    ylabel('|H(w)|');
    
    %% Deler opp signalet til hvert enkelt tall og Dekoder input signalet ved bruk av B�ndpassfilterene tidligere laget
    
    for k = 1:numbersToFilter
        NumberToFilter = toFilter((k-1)*(Fs*0.2)+1:k*(Fs*0.2));
        threshold = 0.85;
        % Siden filteret ikke er perfekt, setter vi grensen p� 0.85.
        % Hvis vi f�r et treff h�yere enn 0.85 s� antar vi derfor at
        % frekvensen finnes.
        temp = []; %Liste for � lagre frekvensene vi finner.
        for n=1:7
            y = filter(filters(n, 1:L), 1, NumberToFilter); %Filtrerer vektoren part gjennom filteret
            if(max(y) > threshold) % Hvis amplituden p� signalet er h�yere enn thresholdet, s� registreres det.
                temp = [temp n]; % Legger til frekvenstallet i listen
            end
        end
        frequencies = [Frekvenser(temp(1)); Frekvenser(temp(2))]; %Henter ut de to dekodede frekvensene fra parten
    
    
        %% Summerer frekvensene og finner ut hvilke sum som h�rer til hvilket tall
        frekvens1 = frequencies(1); % Henter ut den f�rste frekvensen
        frekvens2 = frequencies(2); % Henter ut den andre frekvensen
        sum = frekvens1 + frekvens2; % Summerer frekvensene
       
        %Finner ut hvilken sum som tilh�rer hvilket tall
        switch sum
            case 2388
                decodedNumber = [decodedNumber '1'];
            case 2277
                decodedNumber = [decodedNumber '2'];
            case 2150
                decodedNumber = [decodedNumber '3'];
            case 2299
                decodedNumber = [decodedNumber '4'];
            case 2188
                decodedNumber = [decodedNumber '5'];
            case 2061
                decodedNumber = [decodedNumber '6'];
            case 2217
                decodedNumber = [decodedNumber '7'];
            case 2106
                decodedNumber = [decodedNumber '8'];
            case 1979
                decodedNumber = [decodedNumber '9'];
            case 2144
                decodedNumber = [decodedNumber '2'];
            case 2033
                decodedNumber = [decodedNumber '*'];
            case 1906
                decodedNumber = [decodedNumber '#'];
        end
    end
end