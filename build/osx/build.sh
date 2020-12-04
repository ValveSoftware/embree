#! /bin/bash

EMBREE_CMAKE_BUILD_TYPE=Release
EMBREE_STATIC_LIB=TRUE
EMBREE_TASKING_SYSTEM=INTERNAL

if [[ "$EMBREE_BUILD_SHARED" == "true" ]]; then
    EMBREE_STATIC_LIB=FALSE
    EMBREE_TASKING_SYSTEM=TBB
fi

if [[ "$EMBREE_BUILD_DEBUG" == "true" ]]; then
    EMBREE_CMAKE_BUILD_TYPE=Debug
fi

if [[ "$EMBREE_USE_TBB" == "true" ]]; then
    EMBREE_TASKING_SYSTEM=TBB
fi

cmake \
    -G "Xcode" \
    -DCMAKE_BUILD_TYPE=$EMBREE_CMAKE_BUILD_TYPE \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=10.7 \
    -DBUILD_TESTING=FALSE \
    -DEMBREE_ISPC_SUPPORT=TRUE \
    -DEMBREE_STATIC_LIB=$EMBREE_STATIC_LIB \
    -DEMBREE_STATIC_RUNTIME=TRUE \
    -DEMBREE_TASKING_SYSTEM=$EMBREE_TASKING_SYSTEM \
    -DEMBREE_TUTORIALS=FALSE \
    ../..

cmake --build . --config $EMBREE_CMAKE_BUILD_TYPE
