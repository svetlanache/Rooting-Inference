#!/bin/bash
##################################################
# This script executes the java code
# for the non-reversible and non-stationary models.
###################################################
if [ "$#" -ne 3 ]; then
    echo "Usage: ./rootInference.sh modelType numOfChains parametersFile.txt"
    exit 1
fi

timestamp=$(date +%Y.%m.%d-%H.%M.%S)

curr=$(pwd)
echo "Running rootInference ($1 model, $2 chains)..."
echo "Log file: $curr/logs/log_$timestamp"

if [ ! -d logs ]; then
	mkdir logs
fi

if [ "$1" == "NR" ] || [ "$1" == "NS" ] ||[ "$1" == "NRNS" ]; then
	java -classpath "RootInference.jar:Jama-1.0.3.jar:parallelcolt-0.9.4.jar:PhyloCore.jar" rootinference.RootInference $1 $2 $3 > logs/log_$timestamp
elif [ "$1" == "NR2" ] || [ "$1" == "NR2NS" ]; then
	java -classpath "RootInference.jar:Jama-1.0.3.jar:parallelcolt-0.9.4.jar:PhyloCore.jar" rootinference.RootInference2compMain $1 $2 $3 > logs/log_$timestamp
else 
        echo "Wrong model type. Type NR or NS or NRNS or NR2 or NR2NS"       

fi
