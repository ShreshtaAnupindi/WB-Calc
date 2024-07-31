clear,clc
% Shreshta Anupindi AERE E Project 1 
% Problem 2 Main Scirpt 2
% Purpose: To calculate the density altitude using the temperature,
% essure, and humidity using the data from the url given in the project
% file

% Getting the data using the API key and the url link given to us
key = '7cab1fcaf444883263bc48dd983e6018';
options = weboptions('ContentType','json');
url=['https://api.openweathermap.org/data/2.5/weather?q=','Ames','&APPID=',key];
CurrentData = webread(url, options); % Storing the data from the url

% Accessing the temperature, pressure, and humidity from the stored data
% with the subvariable 'main'
% Temperature in Celcius
temp = CurrentData.main.temp; 
% Pressure in Pascals
pressure = CurrentData.main.pressure;
% Humidity percentage 
humidity = CurrentData.main.humidity;


% Calling the function to convert temperature from kelvin to celcius
[tempC] = kelvinToCelsius (temp);

% Calculating the dew point temperature from the given temperature in
% celcius
dewPoint = tempC - ((100 - humidity)/5);
fprintf("The dew point temperature will be: %.2f Celsius\n", dewPoint)

% Finding the vapor pressure in millibar
vapourPressure = 6.11 * 10^((7.5*dewPoint)/(237.7 + dewPoint));
fprintf("The vapor pressure is %.2f millibar\n",vapourPressure)

% Finding the virtual temperature in Kelvin
virtualTemp = temp/(1 - (vapourPressure/pressure)*(1 - 0.622));
fprintf("The virtual temperature will be: %.2f Kelvin\n",virtualTemp)

% Converting and displaying the virtual temperature from Kelvin to Rankine
virtualtempR = (9/5 * (virtualTemp - 273.13) + 32) + 459.69;
fprintf("The virtual temperature will be: %.2f Rankine\n",virtualtempR)

% The field elevation of the Ames Airport (in feet)
fieldelv = 955.6;

% Converting and displaying pressure in Mercury(HG)
pressureinHG = pressure * 0.02953;
fprintf("The pressure will be %.2f in HG\n",pressureinHG)

% Using the given variables to calculate the density altitude in feet
densityAltitude = fieldelv + (145366 * (1 - ((17.326 * pressureinHG)/virtualtempR)^0.235));
fprintf("The density altitude will be %.2f feet\n", densityAltitude)