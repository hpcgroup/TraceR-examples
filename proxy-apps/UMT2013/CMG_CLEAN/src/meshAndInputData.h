/*
// Copyright 2005 The Regents of the University of California.
// All rights reserved.
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
//
// This work was produced at the University of California, Lawrence
// Livermore National Laboratory (UC LLNL) under contract no.
// W-7405-ENG-48 (Contract 48) between the U.S. Department of Energy
// (DOE) and the Regents of the University of California (University)
// for the operation of UC LLNL.  The rights of the Federal Government are
// reserved under Contract 48 subject to the restrictions agreed upon by
// the DOE and University as allowed under DOE Acquisition Letter 97-1.
//
*/

#ifndef __MESH_AND_INPUT_DATA_H__
#define __MESH_AND_INPUT_DATA_H__

void initMeshAndInputData();

void cleanupNodeData( );
void allocateZoneData( );
void cleanupZoneData( );
void cleanupSubdivisionData( );
/*void calculateMaxNodeIJK(int *i, int *j, int *k);*/
void calculateMasterBlockArray(int *masterArray);




#endif
