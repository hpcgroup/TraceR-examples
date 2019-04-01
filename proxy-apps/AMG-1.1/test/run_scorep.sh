#!/bin/bash

export SCOREP_ENABLE_TRACING=true
export SCOREP_FILTERING_FILE=scorep_filter.txt
export SCOREP_ENABLE_PROFILING=false
export SCOREP_TOTAL_MEMORY=128M

# 1
#export SCOREP_EXPERIMENT_DIRECTORY="1"
#mpirun -np 1 ./amg -problem 2 -n 10 10 10 -p 1 1 1 |& tee srun-1.txt
#exit 123

# 16
#export SCOREP_EXPERIMENT_DIRECTORY="16"
#mpirun -np 16 ./amg -problem 2 -n 64 64 64 -p 4 2 2 |& tee srun-16.txt &
##srun -N 1 -n 16 -ppdebug --time=00:10:00 ./amg -problem 2 -n 40 40 40 -p 4 2 2 |& tee srun-16.txt
#exit 123

# 64
export SCOREP_EXPERIMENT_DIRECTORY="64"
srun -N 4 --ntasks-per-node=16 -ppdebug --time=00:10:00 ./amg -problem 2 -n 64 64 64 -p 4 4 4 |& tee srun-64.txt &

# 256
export SCOREP_EXPERIMENT_DIRECTORY="256"
srun -N 16 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./amg -problem 2 -n 64 64 64 -p 8 8 4 |& tee srun-256.txt &

# 512
export SCOREP_EXPERIMENT_DIRECTORY="512"
srun -N 32 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./amg -problem 2 -n 64 64 64 -p 8 8 8 |& tee srun-512.txt &

# 1024
export SCOREP_EXPERIMENT_DIRECTORY="1024"
srun -N 64 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./amg -problem 2 -n 64 64 64 -p 16 16 4 |& tee srun-1024.txt &

# 2048
export SCOREP_EXPERIMENT_DIRECTORY="2048"
srun -N 128 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./amg -problem 2 -n 64 64 64 -p 16 16 8 |& tee srun-2048.txt &

# 4096
export SCOREP_EXPERIMENT_DIRECTORY="4096"
srun -N 256 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./amg -problem 2 -n 64 64 64 -p 16 16 16 |& tee srun-4096.txt &

wait
