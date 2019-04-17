#!/bin/bash

export SCOREP_ENABLE_TRACING=true
export SCOREP_FILTERING_FILE=scorep_filter.txt
export SCOREP_ENABLE_PROFILING=false
export SCOREP_TOTAL_MEMORY=256M
export SCOREP_REDUCE_PROBE_TEST=1
export SCOREP_MPI_ENABLE_GROUPS=ENV,P2P,COLL,XNONBLOCK

# 1
export SCOREP_EXPERIMENT_DIRECTORY="1"
mpirun -np 1 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 1 --npy 1 --npz 1 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 1 --comm_vars 2 |& tee srun-1.txt &

# 16
export SCOREP_EXPERIMENT_DIRECTORY="16"
mpirun -np 16 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 4 --npy 2 --npz 2 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 1 --comm_vars 2 |& tee srun-16.txt &

# 64
export SCOREP_EXPERIMENT_DIRECTORY="64"
srun -N 4 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 4 --npy 4 --npz 4 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 1 --comm_vars 2 |& tee srun-64.txt &

# 256
export SCOREP_EXPERIMENT_DIRECTORY="256"
srun -N 16 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 8 --npy 8 --npz 4 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 1 --comm_vars 2 |& tee srun-256.txt &

# 512
export SCOREP_EXPERIMENT_DIRECTORY="512"
srun -N 32 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 8 --npy 8 --npz 8 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 1 --comm_vars 2 |& tee srun-512.txt &

# 1024
export SCOREP_EXPERIMENT_DIRECTORY="1024"
srun -N 64 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 16 --npy 16 --npz 4 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 1 --comm_vars 2 |& tee srun-1024.txt &

# 2048
export SCOREP_EXPERIMENT_DIRECTORY="2048"
srun -N 128 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 16 --npy 16 --npz 8 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 1 --comm_vars 2 |& tee srun-2048.txt &

# 4096
export SCOREP_EXPERIMENT_DIRECTORY="4096"
srun -N 256 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 16 --npy 16 --npz 16 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 1 --comm_vars 2 |& tee srun-4096.txt &

wait
