
%% Androgen Deprivation Therapy only.

% Administer ADT until simulation stops
while (time < endSimulationTime);
    
    % Mark time as androgen deprivation only. For plotting purposes and cycle analysis.
    treatmentIndex(time) = 1;
    
    % Calculate population frequencies.
    p = x./sum(x);
    
    % Set current T+ carrying capacity defined by "cheater" level.
    k(1) = x(2) * X_max;
    
    % Set current TP carrying capacity defined by current defined treatment carrying capacity.
    k(2) = k_max(2);
    
    % Set current T- carrying capacity increasing if it is a T- singular tumor
    if(p(3) > 0.99)
        k_max(3) = k_max(3) * 1.0001;
    end
    k(3) = k_max(3);
    
    
    % Calculate dynamics for each population type, T+ TP and T-
    for i = 1:1:3
        
        % LV Dynamics
        G(i) = r(i) * ((k(i) - (competitionCoefficients(i,:) * x'))/k(i));
        
        % Population dynamics
        delta_x(i) = x(i) * G(i);
    end
    
    % Update current population densities
    x = x + delta_x;
    
    %Bound x.
    x(x <= 0.1) = 0.1;
    x(isnan(x)) = 0.1;
    
    % Update PSA
    PSA = PSA + sum(x) - sigmaPSA*PSA;
    
    %Collect data for plotting purposes and cycle analysis.
    all_G(time, :) = G;
    all_x(time,:) = x;
    all_p(time, :) = p;
    all_PSA(time) = PSA;
    
    %Increment time index.
    time = time + 1;
    
    % Check simulation end criteria.
    if(PSA > PSA_GiveABI)
        break;
    end
    
end