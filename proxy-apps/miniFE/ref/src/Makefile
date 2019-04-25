#-----------------------------------------------------------------------

MINIFE_TYPES =  \
        -DMINIFE_SCALAR=double   \
        -DMINIFE_LOCAL_ORDINAL=int      \
        -DMINIFE_GLOBAL_ORDINAL=int

MINIFE_MATRIX_TYPE = -DMINIFE_CSR_MATRIX
# MINIFE_MATRIX_TYPE = -DMINIFE_ELL_MATRIX

#-----------------------------------------------------------------------

CFLAGS = -O3 -g -DWRITE_OTF2_TRACE=1
CXXFLAGS = $(CFLAGS)

CPPFLAGS = -I. -I../utils -I../fem $(MINIFE_TYPES) $(MINIFE_MATRIX_TYPE) \
	-DHAVE_MPI -DMPICH_IGNORE_CXX_SEEK \
	-DMINIFE_REPORT_RUSAGE

LDFLAGS=
LIBS=

SCOREP=$(HOME)/opt/scorep-5.0/bin/scorep --user --nocompiler --noopenmp --nopomp --nocuda --noopenacc --noopencl --nomemory
CXX=$(SCOREP) mpicxx
CC=$(SCOREP) mpicc

CXX_pure=mpicxx
CC_pure=mpicc

#CXX=g++
#CC=gcc

include make_targets

