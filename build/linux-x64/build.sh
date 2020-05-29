#! /bin/bash

cmake \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=FALSE \
    -DEMBREE_ISPC_SUPPORT=TRUE \
    -DEMBREE_STATIC_LIB=TRUE \
    -DEMBREE_TASKING_SYSTEM=INTERNAL \
    -DEMBREE_TUTORIALS=FALSE \
    ../..

cmake --build .
