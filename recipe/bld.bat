mkdir build
cd build

cmake ^
    -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
    .. ^
    -DCMAKE_INSTALL_LIBDIR=lib ^
    -DCMAKE_BUILD_TYPE=Release ^
    -G "Unix Makefiles" ^
    %CMAKE_ARGS%

cmake --build . --config Release
cmake --build . --target install --config Release
