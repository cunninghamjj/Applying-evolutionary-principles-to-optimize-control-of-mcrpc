Software for simulations in manuscript and user's manual.

Created by Jessica Cunningham (jessica.cunningham at moffitt.org) in the department of Imaging at the Moffitt Cancer Research Institute, Tampa, FL.

Publication: In review.

## Table of Contents

##### Matlab Setup to run simulation
1. System requirements
2. Downloading simulation
3. Matlab path requirements

##### Running simulation
1. Setting parameters
2. Using commenting to design simulation


##### Copyright and disclaimer

##### Acknowledgements

## Matlab Setup to run simulatiom

#### 1. System requirements
To setup and run the simulation you will need a computer running version Matlab 2010a or higher. No special toolboxes are required.

#### 2. Downloading simulation
Download the ZIP of all contents from https://github.com/cunninghamjj/Applying-evolutionary-principles-to-optimize-control-of-mcrpc into a folder of your choice. Once downloaded, unzip the contents and discard the .zip file.

#### 3. Matlab path requirements
Open Matlab and change path the folder with the downloaded files. Then go to File -> Set Path -> Add with Subfolders and select the folder with the downloaded files.

## Running Simulation

#### 1. Setting parameters
This simulation has a multitude of parameters to define the specific simulation to run. Below is the explaination of each of the individual parameters.

###### r: This sets the growth rate for T+, TP, and T- respectively. 

###### k_max: This sets the maximum carrying capacities for T+, TP, and T- respectively. 

###### X_max: The level at which TP cells can sustain a T+ population. At 1.5, each TP cell can sustain 1.5 T+ cells.

###### competitionCoefficients: These values represent the alpha(i,j) in the competition matrix. [1 a b; c 1 d; e f 1]

###### x: Initializes the starting densities for T+, TP, and T- respectively. Currently this sets both T+ and TP at half of their carrying capacities and T- at a very low 0.1.

###### time: Initialized to 1.

###### PSA: Initializes the PSA value to the density of cells present in the initial population.

###### sigmaPSA: The decay rate of PSA out of the system at every simulated time step.

#### 2. Using commenting to design simulation
There are two main selection in the design of the simulation. First is choosing the competition matrix second is choosing the treatment regimen. Choosing T+ most fit or TP most fit will change the underlying competition coefficients and subsequently the dynamics of the game. There are three treatment regimens: 'ADT_Only', 'MaximumTolerableDose_Abiraterone', and 'AdaptiveTherapy_Abiraterone'. 'ADT_Only' simulates only androgen deprivation therapy which is the absence of any abiraterone. MaximumTolerableDose_Abiraterone' first lets the tumor establish itself for 10000 generations before administering abiraterone continuously until the end of the simulation. Lastly, 'AdaptiveTherapy_Abiraterone' using the PSA_GiveABI and PSA_StopABI to define when to administer and when to withdraw abiraterone therapy. PSA_GiveABI and PSA_StopABI can be set at any values to show how changing these effects therapy outcome.

Only one competition matrix should be uncommented and only one treatment regimen should be uncommented. 

## COPYRIGHT AND DISCLAIMER

This software and documentation contained with it are copyright © 2016 by Jessica Cunningham and the Moffitt Cancer Research Institute.  All rights are reserved.

This software is supplied 'as is' without any warranty or guarantee of support.  The Moffitt Cancer Research Institute is not responsible for its use, misuse, or functionality.  In no event shall the authors or copyright holders be liable for any claim, damages, or other liability arising from, out of, or in connection with this software.


## ACKNOWLEDGEMENTS

Thanks to both Joel Brown and Robert Gatenby for their patience and support through the many iterations of this simulation. 
