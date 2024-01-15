#!/bin/bash
set -x
set -e

mkdir -p build
cd build

cmake \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    ../src \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -G "Unix Makefiles" \
    ${CMAKE_ARGS}

cmake --build . --config Release
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
    cmake --build . --target test --config Release
fi
cmake --build . --target install --config Release
