#!/bin/bash
#PBS -N One_BenefitLatest_1
#PBS -l select=1:ncpus=128
#PBS -l walltime=24:00:00
#PBS -j oe
#PBS -M habtukiros.nigus@utas.edu.au
#PBS -m abe
#PBS -q r6525

# Load necessary modules or environment settings
module load EasyBuild/4.2.2 Qt5/5.13.1-GCCcore-8.3.0

# Create directories for benefit_one, benefit_supplement_2, and benefit_three
mkdir -p ~/slimwork/New/Latest/new2Ongoing/{supplement_2,supplement_4,supplement_6,supplement_8,supplement_10,supplement_12,supplement_14}/{Female,Male,Both}/benefit_one/{ProbInf_0.008,ProbInf_0.009,ProbInf_0.01,ProbInf_0.02,ProbInf_0.03,ProbInf_0.04,ProbInf_0.05}

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
    local EP="${11}" # Scale of resistance for individuals with beneficial mutation for do nothing benefit one
                     # Minimum age of reproduction for individuals with beneficial mutation for do nothing benefit three
    local NFM="${12}" # Number of migrants
    local Age="${13}" # Max age of migrants
    local FecS="${14}" # Fecundity of susceptible individuals
   local FecI="${15}" # Fecundity of infected individuals
local MIP="${16}" # Number of male individuals taken from wild population to establish insurance population
    local FIP="${17}" # Number of male individuals taken from wild population to establish insurance population
       #local NMM="${19}" # Number of male individuals supplemented from an insurance population to wild population
   local ProDeathy2="${18}" #  Probability of death of infected Year 2
    local ProbRePro="${19}" # Probability of reproducing when either of individuals are infected
  local AgeInf="${20}" # Minimum age of infection
local HMB="${21}" # Age of reproducing for individuals with no beneficial mutation; we also use for minimum age of males reproduction

    local max_jobs=128
    local running_jobs=0
   
     for ((i = 1; i <= 1000; i++)); do
       
        case "$dir" in
        *benefit_one*)
                  ~/build/slim -d MU="$MU" -d RR="$RR" -d K1="$K1" -d K2="$K2" -d L="$L" -d ProbInf="$ProbInf" -d ProDeath="$ProDeath" -d IniInf="$IniInf" -d ScaRes="$EP" -d NFM="$NFM" -d Age="$Age" -d FecS="$FecS" -d FecI="$FecI" -d MIP="$MIP" -d FIP="$FIP"  -d ProDeathy2="$ProDeathy2" -d ProbRePro="$ProbRePro" -d AgeInf="$AgeInf" -d HMB="$HMB" "$dir/$script" > "$dir/Trial_allOn0Revised_$i.csv" &
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
script_scenario_1="BM1_Ongoing.slim"

# script for scenario 1

Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_2/Female/benefit_one/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10 0.005 2 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_2/Female/benefit_one/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10 0.005 2 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_2/Female/benefit_one/ProbInf_0.01 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.01 0.5  10 0.005 0 2 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_2/Female/benefit_one/ProbInf_0.02 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10 0.005 0 2 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_2/Female/benefit_one/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10 0.005 2 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_2/Female/benefit_one/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10 0.005 2 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_2/Female/benefit_one/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10 0.005 2 1 3 2 20 20 0.7 0.5 2  2


Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_4/Female/benefit_one/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10 0.005 4 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_4/Female/benefit_one/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10 0.005 4 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_4/Female/benefit_one/ProbInf_0.01 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.01 0.5  10 0.005 4 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_4/Female/benefit_one/ProbInf_0.02 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10 0.005 4 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_4/Female/benefit_one/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10 0.005 4 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_4/Female/benefit_one/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10 0.005 4 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_4/Female/benefit_one/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10 0.005 4 1 3 2 20 20 0.7 0.5 2  2


Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_6/Female/benefit_one/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10 0.005 6 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_6/Female/benefit_one/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10 0.005 6 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_6/Female/benefit_one/ProbInf_0.01 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.010 0.5  10 0.005 6 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_6/Female/benefit_one/ProbInf_0.02 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10 0.005 6 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_6/Female/benefit_one/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10 0.005 6 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_6/Female/benefit_one/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10 0.005 6 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_6/Female/benefit_one/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10 0.005 6 1 3 2 20 20 0.7 0.5 2  2


Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_8/Female/benefit_one/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10 0.005 8 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_8/Female/benefit_one/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10 0.005 8 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_8/Female/benefit_one/ProbInf_0.01 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.01 0.5  10 0.005 8 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_8/Female/benefit_one/ProbInf_0.02 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10 0.005 8 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_8/Female/benefit_one/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10 0.005 8 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_8/Female/benefit_one/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10 0.005 8 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_8/Female/benefit_one/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10 0.005 8 1 3 2 20 20 0.7 0.5 2  2


Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_10/Female/benefit_one/ProbInf_0.01 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.007 0.5  10 0.005 10 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_10/Female/benefit_one/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10 0.005 10 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_10/Female/benefit_one/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10 0.005 10 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_10/Female/benefit_one/ProbInf_0.01 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.010 0.5  10 0.005 10 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_10/Female/benefit_one/ProbInf_0.02 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10 0.005 10 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_10/Female/benefit_one/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10 0.005 10 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_10/Female/benefit_one/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10 0.005 10 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_10/Female/benefit_one/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10 0.005 10 1 3 2 20 20 0.7 0.5 2  2


Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_12/Female/benefit_one/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10 0.005 12 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_12/Female/benefit_one/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5 10 0.005 12 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_12/Female/benefit_one/ProbInf_0.01 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.010 0.5  10 0.005 12 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_12/Female/benefit_one/ProbInf_0.02 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10 0.005 12 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_12/Female/benefit_one/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10 0.005 12 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_12/Female/benefit_one/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10 0.005 12 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_12/Female/benefit_one/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5  10 0.005 12 1 3 2 20 20 0.7 0.5 2  2

Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_14/Female/benefit_one/ProbInf_0.008 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.008 0.5  10 0.005 14 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_14/Female/benefit_one/ProbInf_0.009 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.009 0.5  10 0.005 14 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_14/Female/benefit_one/ProbInf_0.01 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.010 0.5  10 0.005 14 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_14/Female/benefit_one/ProbInf_0.02 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.02 0.5  10 0.005 14 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_14/Female/benefit_one/ProbInf_0.03 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.03 0.5  10 0.005 14 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_14/Female/benefit_one/ProbInf_0.04 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.04 0.5  10 0.005 14 1 3 2 20 20 0.7 0.5 2  2
Do_slim ~/slimwork/New/Latest/new2Ongoing/supplement_14/Female/benefit_one/ProbInf_0.05 "$script_scenario_1" 0.0000001 0.00000001 100 300 30000000 0.05 0.5 10 0.005 14 1 3 2 20 20 0.7 0.5 2  2


wait
