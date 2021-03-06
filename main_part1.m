function returnArray = main_part1()
T = 0.2; % tid
Fs = 8000; % Punktprøvingsfrekvens
t = 0:1/Fs:T; % Sample vektor
z = 0:1/Fs:.05; % Zero Vektor
returnArray = [];
number = input('Enter the characters you wish to generate DTMF dailing frequncies: ','s');
userInput = input('Do you wish to hear the frequencies genereted by your number? (y/n) ','s');
if userInput=='y';  
    for x = 1:numel(number)
        switch number(x)
            case '1'
                returnArray = [returnArray (sin(2*pi*697*t) + sin(2*pi*1209*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '2'
                returnArray = [returnArray (sin(2*pi*697*t) + sin(2*pi*1336*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '3'
                returnArray = [returnArray (sin(2*pi*697*t) + sin(2*pi*1477*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '4'
                returnArray = [returnArray (sin(2*pi*770*t) + sin(2*pi*1209*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '5'
                returnArray = [returnArray (sin(2*pi*770*t) + sin(2*pi*1336*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '6'
                returnArray = [returnArray (sin(2*pi*770*t) + sin(2*pi*1477*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '7'
                returnArray = [returnArray (sin(2*pi*852*t) + sin(2*pi*1209*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '8'
                returnArray = [returnArray (sin(2*pi*852*t) + sin(2*pi*1336*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '9'
                returnArray = [returnArray (sin(2*pi*852*t)+ sin(2*pi*1477*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '0'
                returnArray = [returnArray (sin(2*pi*941*t) + sin(2*pi*1336*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '*'
                returnArray = [returnArray (sin(2*pi*941*t) + sin(2*pi*1209*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];
            case '#'
                returnArray = [returnArray (sin(2*pi*941*t) + sin(2*pi*1477*t))];
                returnArray = [returnArray (0*sin(2*pi*697*z))];    
            otherwise
                disp([number(x) ' is not a number'])
        end
    end
    sound(returnArray);
end