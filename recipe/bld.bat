call "%RECIPE_DIR%\set_bld_opts.bat"

nmake /f makefile.vc %BLD_OPTS% GDAL_ROOT=%CD%
if errorlevel 1 exit 1

mkdir -p %LIBRARY_PREFIX%\share\doc\gdal
