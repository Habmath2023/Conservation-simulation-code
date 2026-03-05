#!/bin/bash
#PBS -N Females_Neutral_NB
#PBS -l select=1:ncpus=128
#PBS -l walltime=18:00:00
#PBS -j oe
#PBS -M habtukiros.nigus@utas.edu.au
#PBS -m abe
#PBS -q r6525

# Load necessary modules or environment settings
module load EasyBuild/4.2.2 Qt5/5.13.1-GCCcore-8.3.0

# Create directories for NB2, benefit_two, and benefit_three
mkdir -p ~/slimwork/New/Latest/One_off_V1/{supplement_0,supplement_10,supplement_14,supplement_28,supplement_40,supplement_56}/{Female,Male,Both}/NB2/{ProbInf_0.008,ProbInf_0.009,ProbInf_0.010,ProbInf_0.020,ProbInf_0.03,ProbInf_0.04,ProbInf_0.05}

# Function to run SLiM with different SLiM script for each benefit
Do_slim() {
    local dir="$1" 
    local script="$2"
    local MU="$3" # Mutation rate 
    local RR="$4" # Recombination rate
    local K1="$5" # Insurance population carrying capacity
    local K2="$6"  # Wild  population carrying capacity
    local L="$7"  # Chromosome length
    local ProbInf="$8" # Probability of infection
    local ProDeath="$9" # Probability of death
    local IniInf="${10}" # Initial infected individuals
    local NFM="${11}" # Number of migrants
    local Age="${12}" # Max age of migrants
    local FecS="${13}" # Fecundity of susceptible individuals
   local FecI="${14}" # Fecundity of infected individuals
local MIP="${15}" # Number of male individuals taken from wild population to establish insurance population
    local FIP="${16}" # Number of male individuals taken from wild population to establish insurance population
       #local NMM="${19}" # Number of male individuals supplemented from an insurance population to wild population
   local ProDeathy2="${17}" #  Probability of death of infected Year 2
    local ProbRePro="${18}" # Probability of reproducing when either of individuals are infected
  local AgeInf="${19}" # Probability of reproducing when either of individuals are infected
  local HMB="${20}" # 

    local max_jobs=128
    local running_jobs=0
   
     for ((i = 1; i <= 1000; i++)); do
       
        case "$dir" in
        *NB2*)
                  ~/build/slim -d MU="$MU" -d RR="$RR" -d K1="$K1" -d K2="$K2" -d L="$L" -d ProbInf="$ProbInf" -d ProDeath="$ProDeath" -d IniInf="$IniInf"  -d NFM="$NFM" -d Age="$Age" -d FecS="$FecS" -d FecI="$FecI" -d MIP="$MIP" -d FIP="$FIP"  -d ProDeathy2="$ProDeathy2" -d ProbRePro="$ProbRePro" -d AgeInf="$AgeInf" -d HMB="$HMB" "$dir/$script" > "$dir/Trial20NBRevised_$i.csv" &
                ;;
                esac
        echo "Running SLiM for iteration $i, outputting to $output_file"
        running_jobs=$( jobs | wc -l )  # This will give a number to the actual number of jobs running in the background

        # Limit the number of parallel jobs to max_jobs
        while [[ $running_jobs -ge $max_jobs ]]; do
            echo wait.
            sleep 10
            running_jobs=$( jobs | wc -l )
        done
    done
}

# SLiM scripts
script_scenario_1="BM0_One_off.slim"

# script for scenario 1

Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_0/Female/NB2/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10  0 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_0/Female/NB2/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10  0 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_0/Female/NB2/ProbInf_0.010 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.01 0.5  10  0 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_0/Female/NB2/ProbInf_0.020 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10  0 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_0/Female/NB2/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10  0 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_0/Female/NB2/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10  0 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_0/Female/NB2/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10  0 1 3 2 20 20 0.7 0.5 2 2

Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_10/Female/NB2/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10  10 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_10/Female/NB2/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10  10 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_10/Female/NB2/ProbInf_0.010 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.010 0.5  10  10 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_10/Female/NB2/ProbInf_0.020 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10  10 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_10/Female/NB2/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10  10 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_10/Female/NB2/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10  10 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_10/Female/NB2/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10  10 1 3 2 20 20 0.7 0.5 2 2

Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_14/Female/NB2/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10  14 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_14/Female/NB2/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10  14 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_14/Female/NB2/ProbInf_0.010 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.010 0.5  10  14 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_14/Female/NB2/ProbInf_0.020 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10  14 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_14/Female/NB2/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10  14 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_14/Female/NB2/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10  14 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_14/Female/NB2/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5 10  14 1 3 2 20 20 0.7 0.5 2 2

Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_28/Female/NB2/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10  28 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_28/Female/NB2/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5 10  28 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_28/Female/NB2/ProbInf_0.010 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.010 0.5  10  28 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_28/Female/NB2/ProbInf_0.020 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10  28 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_28/Female/NB2/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10  28 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_28/Female/NB2/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10  28 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_28/Female/NB2/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10  28 1 3 2 20 20 0.7 0.5 2 2

Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_40/Female/NB2/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10  40 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_40/Female/NB2/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10  40 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_40/Female/NB2/ProbInf_0.010 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.010 0.5  10  40 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_40/Female/NB2/ProbInf_0.020 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10  40 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_40/Female/NB2/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10  40 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_40/Female/NB2/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10  40 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_40/Female/NB2/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10  40 1 3 2 20 20 0.7 0.5 2 2

Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_56/Female/NB2/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10  56 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_56/Female/NB2/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10  56 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_56/Female/NB2/ProbInf_0.010 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.01 0.5  10  56 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_56/Female/NB2/ProbInf_0.020 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10  56 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_56/Female/NB2/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10  56 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_56/Female/NB2/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10  56 1 3 2 20 20 0.7 0.5 2 2
Do_slim ~/slimwork/New/Latest/One_off_V1/supplement_56/Female/NB2/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10  56 1 3 2 20 20 0.7 0.5 2 2


wait
