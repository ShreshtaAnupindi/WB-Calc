clear,clc
% Shreshta Anupindi AERE E Project 1 
% Problem 1 Main Script 1
% Purpose: to calculate and check the weight and balance of the 1965 Piper Cherokee PA-28-180.
% Aircraft using the weights according to user input

% Inclduing all the infromation given to us in the project file
empty_Weight_inLbs = 1471;
centre_Of_Gravity_When_Empty = 85.9;
moment_Arm_Front_Seats = 85.5;
moment_Arm_Fuel_Tanks = 95;
moment_Arm_Rear_Seats = 118.1;
max_aircraft_Weight_inLbs = 2400; 
max_Fuel_inGallons = 50;

% Using a while loop to start the calculator
% The while loop is used to switch on the calculator
i = 0;
while (i == 0)
    disp("This is the Weight and Balance Calculator of the 1965 Piper Cherokee PA-28-180 aircraft")
    disp("To get the values for the weights, please answer the follwoing questions. ")
    
    % Calls out the function which will store the inputs values given by the user
    [fuel_Weight,pilot_Weight,copilot_Weight,passenger1_Weight,passenger2_Weight] = inputValues;
    
    % Below is a while loop to check whether the fuel weight values are within the given range or not
    
    % Inside the while loop, there is a if statement included to say that if the the fuel weight greater than 0 and
    % the fuel weight is less than or equal to the max fuel in gallons
   
    x = 1;
    while x > 0
        if (fuel_Weight > 0 && fuel_Weight <= max_Fuel_inGallons)
            x = 0;
        % An else statement if the fuel is not within the range and it will
        % ask again to enter a weight of the fuel in gallons

        else 
            disp("Please enter fuel weight value within range.")
            fuel_Weight = input("Please enter the weight of fuel required (in US Gallons): ");
            x = 1;
        end

        % Calculates the total weight of fuel tank
        total_Fuel = fuel_Weight * 6;

        % Total weight using the input values given by the user (user given
        % values)
        aircraft_Weight = total_Fuel + pilot_Weight + copilot_Weight + passenger1_Weight + passenger2_Weight + empty_Weight_inLbs;
        fprintf("Total weight in lbs: %.0f \n",aircraft_Weight)

        % A if loop to check whether the total weight exceeds the maximum weight
        % or not
        if aircraft_Weight <= max_aircraft_Weight_inLbs
            disp("The total weight is within range")

            moment_Arm_Front_Seats = moment_Arm_Front_Seats * (pilot_Weight+copilot_Weight);
            moment_Arm_Fuel_Tanks = moment_Arm_Fuel_Tanks * total_Fuel;
            moment_Arm_Rear_Seats = moment_Arm_Rear_Seats * (passenger1_Weight + passenger2_Weight);
            moment_Empty_Aircraft = empty_Weight_inLbs * centre_Of_Gravity_When_Empty;

            total_Moment = moment_Arm_Front_Seats + moment_Arm_Fuel_Tanks + moment_Arm_Rear_Seats + moment_Empty_Aircraft;
            fprintf("Moment of front seat is: %.2f\n",moment_Arm_Front_Seats)
            fprintf("Moment of fuel tank: %.2f\n",moment_Arm_Fuel_Tanks)
            fprintf("Moment of rear seat: %.2f\n",moment_Arm_Rear_Seats)
            fprintf("Moment of empty aircraft: %.2f\n",moment_Empty_Aircraft)
            fprintf("Total moment of aircraft is %.2f \n",total_Moment)

        else 
            disp("Weight is out of range, please enter information accordingly")
            x = 1;
        end

        % Finding centre of gravity of aircraft if total weight is approved
        CG_aircraft = total_Moment/aircraft_Weight;
        fprintf("The final centre of gravity of aircraft is %.2f.\n",CG_aircraft)

        % To check if the centre of gravity value is within the given range or not
        if CG_aircraft >= 86.8 && CG_aircraft <= 95.8
            disp("The weight and balance of the aircraft is within range.")
        else
            disp("The weight and balance of the aircraft is not within range. Please enter the correct information.")
            x = 1;
        end
    end
    % Loop to either restart the calculator for different calculation or
    % exit the calculator and just display thank you for using the
    % calculator. Have a nice day!
    answer = input(" 0 to run again and 1 to stop: ");
    if answer == 0
       a = 0;
    else
        %isp("Thanks for using the calculator. Have a nice day! ")
        a = 1;
    end
end
