% Shreshta Anupindi AERE E Project 1 
% Problem 1 Function 1
% Purpose: To ask the user for input values for the required weights

function [fuel_Weight,pilot_Weight,copilot_Weight,passenger1_Weight,passenger2_Weight] = inputValues

% the user input values for the weights of the fuel, pilot, co-pilot, and
% the passengers
fuel_Weight = input("Please enter the weight of fuel required (in US Gallons): ");
pilot_Weight = input("Weight of the pilot is (in lbs): ");
copilot_Weight = input("Weight of the copilot is (in lbs): ");
passenger1_Weight = input("Weight of first passenger is (in lbs, if no passenger enter 0): ");
passenger2_Weight = input("Weight of second passenger is (in lbs, if no passenger enter 0): ");

end % ending the function