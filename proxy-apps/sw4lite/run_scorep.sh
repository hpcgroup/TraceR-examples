#!/bin/bash

export SCOREP_ENABLE_TRACING=true
export SCOREP_FILTERING_FILE=scorep_filter.txt
export SCOREP_ENABLE_PROFILING=false
export SCOREP_TOTAL_MEMORY=256M
export SCOREP_REDUCE_PROBE_TEST=1
export SCOREP_MPI_ENABLE_GROUPS=ENV,P2P,COLL,XNONBLOCK

# 16
#rm -rf 16
#export SCOREP_EXPERIMENT_DIRECTORY="16"
#srun -N 1 --ntasks-per-node=16 -ppdebug --time=00:05:00 \
#    optimize_quartz/sw4lite tests/pointsource/pointsource-"$SCOREP_EXPERIMENT_DIRECTORY".in \
#    |& tee srun-16.txt &


# 64
#rm -rf 64
#export SCOREP_EXPERIMENT_DIRECTORY="64"
#srun -N 4 --ntasks-per-node=16 -ppdebug --time=00:10:00 \
#    optimize_quartz/sw4lite tests/pointsource/pointsource-"$SCOREP_EXPERIMENT_DIRECTORY".in \
#    |& tee srun-64.txt &

# 256
rm -rf 256
export SCOREP_EXPERIMENT_DIRECTORY="256"
srun -N 16 --ntasks-per-node=16 -ppbatch --time=00:10:00 \
    optimize_quartz/sw4lite tests/pointsource/pointsource-"$SCOREP_EXPERIMENT_DIRECTORY".in \
    |& tee srun-256.txt &

# 512
rm -rf 512
export SCOREP_EXPERIMENT_DIRECTORY="512"
srun -N 32 --ntasks-per-node=16 -ppbatch --time=00:10:00 \
    optimize_quartz/sw4lite tests/pointsource/pointsource-"$SCOREP_EXPERIMENT_DIRECTORY".in \
    |& tee srun-512.txt &

# 1024
rm -rf 1024
export SCOREP_EXPERIMENT_DIRECTORY="1024"
srun -N 64 --ntasks-per-node=16 -ppbatch --time=00:10:00 \
    optimize_quartz/sw4lite tests/pointsource/pointsource-"$SCOREP_EXPERIMENT_DIRECTORY".in \
    |& tee srun-1024.txt &

# 2048
rm -rf 2048
export SCOREP_EXPERIMENT_DIRECTORY="2048"
srun -N 128 --ntasks-per-node=16 -ppbatch --time=00:10:00 \
    optimize_quartz/sw4lite tests/pointsource/pointsource-"$SCOREP_EXPERIMENT_DIRECTORY".in \
    |& tee srun-2048.txt &

# 4096
rm -rf 4096
export SCOREP_EXPERIMENT_DIRECTORY="4096"
srun -N 256 --ntasks-per-node=16 -ppbatch --time=00:10:00 \
    optimize_quartz/sw4lite tests/pointsource/pointsource-"$SCOREP_EXPERIMENT_DIRECTORY".in \
    |& tee srun-4096.txt &

wait

echo 'All done'
