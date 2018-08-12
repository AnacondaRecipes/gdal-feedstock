#!/bin/bash

set -e # Abort on error.

export CPPFLAGS="$CPPFLAGS -I$PREFIX/include"

# Filter out -std=.* from CXXFLAGS as it disrupts checks for C++ language levels.
re='(.*[[:space:]])\-std\=[^[:space:]]*(.*)'
if [[ "${CXXFLAGS}" =~ $re ]]; then
    export CXXFLAGS="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
fi

bash configure --prefix=$PREFIX \
            --host=$HOST \
            --with-curl \
            --with-dods-root=$PREFIX \
            --with-expat=$PREFIX \
            --with-freexl=$PREFIX \
            --with-geos=$PREFIX/bin/geos-config \
            --with-hdf4=$PREFIX \
            --with-hdf5=$PREFIX \
            --with-jpeg=$PREFIX \
            --with-kea=$PREFIX/bin/kea-config \
            --with-libjson-c=$PREFIX \
            --with-libz=$PREFIX \
            --with-libkml=$PREFIX \
            --with-libtiff=$PREFIX \
            --with-liblzma=yes \
            --with-netcdf=$PREFIX \
            --with-openjpeg=$PREFIX \
            --with-poppler=$PREFIX \
            --with-pcre \
            --with-pg=$PREFIX/bin/pg_config \
            --with-png=$PREFIX \
            --with-spatialite=$PREFIX \
            --with-sqlite3=$PREFIX \
            --with-static-proj4=$PREFIX \
            --with-xerces=$PREFIX \
            --with-xml2=$PREFIX \
            --without-python \
            --verbose \
            ${OPTS}

make -j ${CPU_COUNT} ${VERBOSE_AT}
