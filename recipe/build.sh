#!/bin/bash
# Get an updated config.sub and config.guess
# cp $BUILD_PREFIX/share/gnuconfig/config.* .

set -ex # Abort on error.

# also allow newer symbols (https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk)
export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY -DHAVE_POPPLER"

mkdir build
cd build

echo "CMAKE_ARGS: ${CMAKE_ARGS} ..."

# Make sure to disable Arrow/Parquet dependencies for now, so they are only
# used in build_arrow_parquet
# Need C++20 for string methods (https://en.cppreference.com/w/cpp/string/basic_string_view/starts_with)
cmake -G "Unix Makefiles" \
      ${CMAKE_ARGS} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_OSX_SYSROOT=${CONDA_BUILD_SYSROOT} \
      -DCMAKE_CXX_STANDARD=20 \
      -DCMAKE_CXX_STANDARD_REQUIRED=ON \
      -DBUILD_SHARED_LIBS=ON \
      -DGDAL_USE_PARQUET=OFF \
      -DGDAL_USE_ARROW=OFF \
      -DGDAL_USE_ARROWDATASET=OFF \
      -DBUILD_PYTHON_BINDINGS:BOOL=OFF \
      -DBUILD_JAVA_BINDINGS:BOOL=OFF \
      -DBUILD_CSHARP_BINDINGS:BOOL=OFF \
      ${SRC_DIR}

cmake --build . -j ${CPU_COUNT} --config Release
