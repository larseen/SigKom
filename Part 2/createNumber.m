function tlf = createNumber (sumfrekvenser)
%The function returns the number that corresponds to the input frequency
    switch sumfrekvenser
        case 2388
            tlf = '1';
        case 2277
            tlf = '2';
        case 2150
            tlf = '3';
        case 2299
            tlf = '4';
        case 2188
            tlf = '5';
        case 2061
            tlf = '6';
        case 2217
            tlf = '7';
        case 2106
            tlf = '8';
        case 1979
            tlf = '9';
        case 2144
            tlf = '*';
        case 2033
            tlf = '0';
        case 1906
            tlf = '#';
    end
end
