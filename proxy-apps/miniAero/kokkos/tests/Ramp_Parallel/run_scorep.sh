#!/bin/bash

export SCOREP_ENABLE_TRACING=true
export SCOREP_FILTERING_FILE=scorep_filter.txt
export SCOREP_ENABLE_PROFILING=false
export SCOREP_TOTAL_MEMORY=256M
export SCOREP_REDUCE_PROBE_TEST=1
export SCOREP_MPI_ENABLE_GROUPS=ENV,P2P,COLL,XNONBLOCK

for ranks in "$@";
do
    nodes=$(( ranks / 16 ))
    echo "ranks $ranks nodes $nodes"
    # TODO: check if nodes is 0
    rm -rf $ranks
    export SCOREP_EXPERIMENT_DIRECTORY="$ranks"
    cp miniaero-$SCOREP_EXPERIMENT_DIRECTORY.inp miniaero.inp
    srun -N $nodes --ntasks-per-node=16 -ppbatch --time=00:10:00 \
        ../../miniAero.mpi \
        |& tee srun-$ranks &
done

wait
