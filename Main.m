% clear('all')
% close('all')
% clc


%% Set population dynamics parameters.

% Growth rates
r = [0.0025, 0.001, 0.0005];

% Carrying capacities
k_max = [0, 800, 800];

% Symbiotic "cheater" level
X_max = 1.5;


%% Choose parameter set by uncommenting.

% T+ most fit
competitionCoefficients = [1 0.402 0.794; 0.010 1 0598; 0.206 0.990 1];
x =  [k_max(2) * X_max * 0.5 k_max(2) * 0.5 0.1];

%TP most fit
% competitionCoefficients = [1 0.598 0.794; 0.010 1 0.206; 0.402 0.990 1];
% x =  [k_max(2)*X_max *0.5 k_max(2) * 0.5 0.1];


%% Simulation initial conditions
%Simulation Conditions
time = 1;
endSimulationTime = 30000;

% Set PSA
PSA = sum(x);
sigmaPSA = 0.2;


%% Uncomment the treatment regimen desired.
treatment = 'ADT_Only';
% treatment = 'MaximumTolerableDose_Abiraterone';
% treatment = 'AdaptiveTherapy_Abiraterone';


if strcmp(treatment, 'ADT_Only')
    
    % Androgen deprivation therapy
    PSA_GiveABI = inf;
    ADT_ONLY;
    
    % Plot function and no abiraterone statistics to extract
    abiCycleInfo = [];
    SimulationEndFunction;
    
    
elseif strcmp(treatment, 'MaximumTolerableDose_Abiraterone')
    
    % Run ADT only for 10000 generations to set up tumor then reset endSimulationTime to max time desired.
    endSimulationTime = 10000;
    PSA_GiveABI = inf;
    PSA_StopABI = 0;
   
    ADT_ONLY;
    
    endSimulationTime = 30000;
    ABI_ADT;
    
    %Plot function and abiraterone statistics extraction
    ExtractAbiCycleDynamics;
    SimulationEndFunction;
    
    
elseif strcmp(treatment, 'AdaptiveTherapy_Abiraterone')
    
    % Run ADT only for 10000 generations to set up tumor then reset endSimulationTime to max time desired.
    endSimulationTime = 10000;
    PSA_GiveABI = inf;
    ADT_ONLY;
    
    % Adaptive Abiraterone based on PSA value
    endSimulationTime = 30000;
    PSA_GiveABI = 3000;
    PSA_StopABI = 1500;
    
    % Initiate for cycles
    cycleNum = 0;
    
    while (time < endSimulationTime)
        % Begin cycles!
        % Increment cycle index and give ADT only followed by Abiraterone.
        cycleNum = cycleNum + 1;
        fprintf('Cycle %d\n', cycleNum)
        
        ADT_ONLY;
        ABI_ADT;
    end
    
    %Plot function and cycle statistics extraction
    ExtractAbiCycleDynamics;
    SimulationEndFunction;
    
end


