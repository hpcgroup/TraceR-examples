#!/bin/bash

export SCOREP_ENABLE_TRACING=true
export SCOREP_FILTERING_FILE=scorep_filter.txt
export SCOREP_ENABLE_PROFILING=false
export SCOREP_TOTAL_MEMORY=128M

# 1
#export SCOREP_EXPERIMENT_DIRECTORY="1"
#V=$(( 32000 * 1 ))
#mpirun -np 1 ./miniVite -n $V |& tee srun-1.txt
#exit 123

# 16
#export SCOREP_EXPERIMENT_DIRECTORY="16"
#V=$(( 32000 * 16 ))
#mpirun -np 16 ./miniVite -n $V |& tee srun-16.txt &
##srun -N 1 -n 16 -ppdebug --time=00:10:00 ./miniVite -n $V |& tee srun-16.txt
#exit 123

# 64
V=$(( 32000 * 64 ))
export SCOREP_EXPERIMENT_DIRECTORY="64"
srun -N 4 --ntasks-per-node=16 -ppdebug --time=00:10:00 ./miniVite -n $V |& tee srun-64.txt &

# 256
V=$(( 32000 * 256 ))
export SCOREP_EXPERIMENT_DIRECTORY="256"
srun -N 16 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./miniVite -n $V |& tee srun-256.txt &

# 512
V=$(( 32000 * 512 ))
export SCOREP_EXPERIMENT_DIRECTORY="512"
srun -N 32 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./miniVite -n $V |& tee srun-512.txt &

# 1024
V=$(( 32000 * 1024 ))
export SCOREP_EXPERIMENT_DIRECTORY="1024"
srun -N 64 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./miniVite -n $V |& tee srun-1024.txt &

# 2048
V=$(( 32000 * 2048 ))
export SCOREP_EXPERIMENT_DIRECTORY="2048"
srun -N 128 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./miniVite -n $V |& tee srun-2048.txt &

# 4096
V=$(( 32000 * 4096 ))
export SCOREP_EXPERIMENT_DIRECTORY="4096"
srun -N 256 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./miniVite -n $V |& tee srun-4096.txt &

wait
