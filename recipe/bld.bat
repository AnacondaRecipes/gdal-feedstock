mkdir build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1

if  %vc% LEQ 9 set MSVC_VER=1500
if  %vc% GTR 9 set MSVC_VER=1900

if  %vc% LEQ 9 set MSVC_TS_VER=90
if  %vc% GTR 9 set MSVC_TS_VER=140

REM Make sure to disable Arrow/Parquet dependencies for now, so they are only
REM used in build_arrow_parquet

cmake -G "Ninja" ^
      "%CMAKE_ARGS%" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_CXX_FLAGS="-DHAVE_POPPLER" ^
      -DBUILD_SHARED_LIBS=ON ^
      -DBUILD_TESTING=OFF ^
      -DBUILD_PYTHON_BINDINGS:BOOL=OFF ^
      -DBUILD_JAVA_BINDINGS:BOOL=OFF ^
      -DBUILD_CSHARP_BINDINGS:BOOL=OFF ^
      -DGDAL_USE_MYSQL:BOOL=OFF ^
      -DGDAL_USE_MSSQL_ODBC:BOOL=OFF ^
      -DGDAL_USE_PARQUET=OFF ^
      -DGDAL_USE_ARROW=OFF ^
      -DGDAL_USE_ARROWDATASET=OFF ^
      -DGDAL_USE_OPENJPEG=OFF ^
      -DGDAL_USE_POPPLER=OFF ^
      -DGDAL_USE_POSTGRESQL=OFF ^
      -DGDAL_USE_CFITSIO=OFF ^
      -DGDAL_USE_FREEXL=OFF ^
      -DGDAL_USE_LIBAEC=OFF ^
      -DGDAL_USE_KEA=OFF ^
      -DGDAL_USE_TILEDB=OFF ^
      -DGDAL_USE_NETCDF=OFF ^
      -DGDAL_USE_HDF4=OFF ^
      -DGDAL_USE_HDF5=OFF ^
      -DGDAL_USE_AVIF=OFF ^
      -DGDAL_USE_HEIF=OFF ^
      -DGDAL_USE_ADBCDRIVERMANAGER=OFF ^
      -DOGR_ENABLE_DRIVER_ARROW=OFF ^
      -DOGR_ENABLE_DRIVER_PARQUET=OFF ^
      -DGDAL_ENABLE_DRIVER_JP2OPENJPEG=OFF ^
      -DGDAL_ENABLE_DRIVER_PDF=OFF ^
      -DGDAL_ENABLE_DRIVER_POSTGISRASTER=OFF ^
      -DOGR_ENABLE_DRIVER_PG=OFF ^
      -DGDAL_ENABLE_DRIVER_FITS=OFF ^
      -DOGR_ENABLE_DRIVER_XLS=OFF ^
      -DGDAL_ENABLE_DRIVER_GRIB=OFF ^
      -DGDAL_ENABLE_DRIVER_KEA=OFF ^
      -DGDAL_ENABLE_DRIVER_TILEDB=OFF ^
      -DGDAL_ENABLE_DRIVER_NETCDF=OFF ^
      -DGDAL_ENABLE_DRIVER_HDF4=OFF ^
      -DGDAL_ENABLE_DRIVER_HDF5=OFF ^
      -DGDAL_ENABLE_DRIVER_AVIF=OFF ^
      -DGDAL_ENABLE_DRIVER_HEIF=OFF ^
      -DOGR_ENABLE_DRIVER_ADBC=OFF ^
      -DOGR_REGISTER_DRIVER_ARROW_FOR_LATER_PLUGIN=ON ^
      -DOGR_REGISTER_DRIVER_PARQUET_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_JP2OPENJPEG_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_PDF_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_POSTGISRASTER_FOR_LATER_PLUGIN=ON ^
      -DOGR_REGISTER_DRIVER_PG_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_FITS_FOR_LATER_PLUGIN=ON ^
      -DOGR_REGISTER_DRIVER_XLS_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_GRIB_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_KEA_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_TILEDB_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_NETCDF_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_HDF4_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_HDF5_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_AVIF_FOR_LATER_PLUGIN=ON ^
      -DGDAL_REGISTER_DRIVER_HEIF_FOR_LATER_PLUGIN=OFF ^
      -DOGR_REGISTER_DRIVER_ADBC_FOR_LATER_PLUGIN=ON ^
      -DOGR_DRIVER_ARROW_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-arrow-parquet'" ^
      -DOGR_DRIVER_PARQUET_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-arrow-parquet'" ^
      -DGDAL_DRIVER_JP2OPENJPEG_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-jp2openjpeg'" ^
      -DGDAL_DRIVER_PDF_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-pdf'" ^
      -DGDAL_DRIVER_POSTGISRASTER_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-postgisraster'" ^
      -DOGR_DRIVER_PG_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-pg'" ^
      -DGDAL_DRIVER_FITS_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-fits'" ^
      -DOGR_DRIVER_XLS_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-xls'" ^
      -DGDAL_DRIVER_KEA_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-kea'" ^
      -DGDAL_DRIVER_TILEDB_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-tiledb'" ^
      -DGDAL_DRIVER_NETCDF_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-netcdf'" ^
      -DGDAL_DRIVER_HDF4_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-hdf4'" ^
      -DGDAL_DRIVER_HDF5_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-hdf5'" ^
      -DGDAL_DRIVER_AVIF_PLUGIN_INSTALLATION_MESSAGE="You may install it with 'conda install libgdal-avif'" ^
      -DGDAL_DRIVER_HEIF_PLUGIN_INSTALLATION_MESSAGE="libgdal-heif is not currently available from Anaconda" ^
      -DOGR_DRIVER_ADBC_PLUGIN_INSTALLATION_MESSAGE="libgdal-adbc is not currently available from Anaconda" ^
      "%SRC_DIR%"

if errorlevel 1 exit /b 1

cmake --build . -j %CPU_COUNT% --verbose --config Release
if errorlevel 1 exit /b 1

copy CMakeCache.txt CMakeCache.txt.orig

cmake --build . --config Release --target install
if errorlevel 1 exit /b 1

set ACTIVATE_DIR=%PREFIX%\etc\conda\activate.d
set DEACTIVATE_DIR=%PREFIX%\etc\conda\deactivate.d
mkdir %ACTIVATE_DIR%
mkdir %DEACTIVATE_DIR%

copy %RECIPE_DIR%\scripts\activate.bat %ACTIVATE_DIR%\gdal-activate.bat
if errorlevel 1 exit 1

copy %RECIPE_DIR%\scripts\deactivate.bat %DEACTIVATE_DIR%\gdal-deactivate.bat
if errorlevel 1 exit 1


:: Copy powershell activation scripts
copy %RECIPE_DIR%\scripts\activate.ps1 %ACTIVATE_DIR%\gdal-activate.ps1
if errorlevel 1 exit 1

copy %RECIPE_DIR%\scripts\deactivate.ps1 %DEACTIVATE_DIR%\gdal-deactivate.ps1
if errorlevel 1 exit 1



:: Copy unix shell activation scripts, needed by Windows Bash users
copy %RECIPE_DIR%\scripts\activate.sh %ACTIVATE_DIR%\gdal-activate.sh
if errorlevel 1 exit 1

copy %RECIPE_DIR%\scripts\deactivate.sh %DEACTIVATE_DIR%\gdal-deactivate.sh
if errorlevel 1 exit 1
