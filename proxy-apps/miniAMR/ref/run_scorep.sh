#!/bin/bash

export SCOREP_ENABLE_TRACING=true
export SCOREP_FILTERING_FILE=scorep_filter.txt
export SCOREP_ENABLE_PROFILING=false
export SCOREP_TOTAL_MEMORY=256M

# 1

export SCOREP_EXPERIMENT_DIRECTORY="1"
mpirun -np 1 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 1 --npy 1 --npz 1 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 100 --comm_vars 2 |& tee srun-1.txt &
#srun -N 1 --ntasks-per-node=16 -ppdebug --time=00:10:00 ./ma.x --num_refine 4 --max_blocks 4000 --init_x 1 --init_y 1 --init_z 1 --npx 4 --npy 2 --npz 2 --nx 8 --ny 8 --nz 8 --num_objects 2 --object 2 0 -1.10 -1.10 -1.10 0.030 0.030 0.030 1.5 1.5 1.5 0.0 0.0 0.0 --object 2 0 0.5 0.5 1.76 0.0 0.0 -0.025 0.75 0.75 0.75 0.0 0.0 0.0 --num_tsteps 10 --checksum_freq 4 --stages_per_ts 16
#mpirun -np 1 ./ma.x --nx 64 --ny 64 --nz 64

# 16
export SCOREP_EXPERIMENT_DIRECTORY="16"
mpirun -np 16 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 4 --npy 2 --npz 2 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 100 --comm_vars 2 |& tee srun-16.txt &
#srun -N 1 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
#    --npx 4 --npy 2 --npz 2 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
#    --num_tsteps 100 --comm_vars 2
exit 123

# 64
export SCOREP_EXPERIMENT_DIRECTORY="64"
srun -N 4 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 4 --npy 4 --npz 4 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 100 --comm_vars 2 |& tee srun-64.txt &

# 256
export SCOREP_EXPERIMENT_DIRECTORY="256"
srun -N 16 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 8 --npy 8 --npz 4 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 100 --comm_vars 2 |& tee srun-256.txt &
srun -N 16 --n-tasks-per-node=16 -ppbatch --time=00:10:00 ./amg -problem 2 -n 64 64 64 -p 8 8 4 |& tee tee srun-64.txt &

# 512
export SCOREP_EXPERIMENT_DIRECTORY="512"
srun -N 32 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 8 --npy 8 --npz 8 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 100 --comm_vars 2 |& tee srun-512.txt &

# 1024
export SCOREP_EXPERIMENT_DIRECTORY="1024"
srun -N 64 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 16 --npy 16 --npz 4 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 100 --comm_vars 2 |& tee srun-1024.txt &

# 2048
export SCOREP_EXPERIMENT_DIRECTORY="2048"
srun -N 128 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 16 --npy 16 --npz 8 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 100 --comm_vars 2 |& tee srun-2048.txt &

# 4096
export SCOREP_EXPERIMENT_DIRECTORY="4096"
srun -N 256 --ntasks-per-node=16 -ppbatch --time=00:10:00 ./ma.x  --num_refine 4 --max_blocks 6000 --init_x 1 --init_y 1 --init_z 1 \
    --npx 16 --npy 16 --npz 16 --nx 8 --ny 8 --nz 8 --num_objects 1 --object 2 0 -0.01 -0.01 -0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0009 0.0009 0.0009 \
    --num_tsteps 100 --comm_vars 2 |& tee srun-4096.txt &

wait
