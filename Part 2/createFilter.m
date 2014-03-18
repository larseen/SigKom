function filter = createFilter()
%The function creates an array with filters for each of the frequencies
%It returns and plots the different filters
    Fs = 8000;
    L = 400; %L is set to 400 to get the maximum frequency respons in the filter
    %and to make it easy to determine the different frequencies
    colors = ['r' 'b' 'y' 'g' 'm' 'c' 'k'];
    frequencies = [697 770 852 941 1209 1336 1447];
    filter =[];
    
    figure(1)
    N = 1:L-1;
    Hlp = 1/L; %Low-pass filter
    for i=1:7
        Wc = 2*pi*frequencies(i)/Fs; %Center frequence
        Hbp = 2*Hlp*cos(Wc*N); %Band-pass filter
        filter = [filter; Hbp];
        [H W] = freqz(Hbp, 1, L);
        plot(W*Fs / (2*pi), abs(H), colors(i));
        hold on;
    end
    xlabel('Frekvens');
    title('Filter');
    axis([400 2000 0 1]);
    hold off;
end