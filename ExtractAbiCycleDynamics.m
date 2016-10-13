
%% Extract abiraterone cycle statistics

% Define array for when abiraterone is administered equal to one and zero otherwise.
time = length(treatmentIndex);
abiraterone_ON = zeros(length(treatmentIndex), 1);
abiraterone_ON(treatmentIndex == 2) = 1;

% Extract cycles
abiCycle = 0;
for time = 1:1:length(abiraterone_ON) - 1;
    
    % If switching abiraterone to on, start new cycle.
    if abiraterone_ON(time + 1) - abiraterone_ON(time) == 1;
        
        % Increment index
        abiCycle = abiCycle + 1;
        abiCycleInfo(abiCycle, 1:3) = 0;
        
        % Record start time of cycle
        abiCycleInfo(abiCycle, 1) = time;
        
        % If this is not our first cycle then find time between start of
        % cycles.
        if (abiCycle > 1)
            abiCycleInfo(abiCycle, 3) = abiCycleInfo(abiCycle, 1) - abiCycleInfo(abiCycle - 1, 1);
        end
        
    elseif abiraterone_ON(time + 1) - abiraterone_ON(time) == -1;
        
        % If ending a cycle, record the length of the cycle.
        abiCycleInfo(abiCycle, 2) = time - abiCycleInfo(abiCycle, 1);
    end
    
end

% Close the last cycle if the simulation ended during it.
if abiCycleInfo(abiCycle, 2) == 0;
        abiCycleInfo(abiCycle, 2) = length(abiraterone_ON) - abiCycleInfo(abiCycle, 1);
end


% Display cycle data.
fprintf('\nCycle number \tStart Time \tCycle Length \tTime between cycles \n')
for i = 1:size(abiCycleInfo, 1)
    fprintf('%d \t\t%d \t\t%d \t\t%d \n', i, abiCycleInfo(i, :))
end


