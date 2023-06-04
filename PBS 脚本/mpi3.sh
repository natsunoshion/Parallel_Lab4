#!/bin/sh
#PBS -N mpi
#PBS -l nodes=4

LOG_DIR="/home/ss2113958/MPI"

pssh -h $PBS_NODEFILE mkdir -p $LOG_DIR 1>&2
scp master:$LOG_DIR/mpi $LOG_DIR
pscp -h $PBS_NODEFILE $LOG_DIR/mpi $LOG_DIR 1>&2
mpiexec -np 3 -machinefile $PBS_NODEFILE $LOG_DIR/mpi
