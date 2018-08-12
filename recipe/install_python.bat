echo on

call "%RECIPE_DIR%\set_bld_opts.bat"

echo %BLD_OPTS%

pushd swig\python

%PYTHON% setup.py build_ext ^
        --include-dirs %LIBRARY_INC% ^
        --library-dirs %LIBRARY_LIB% ^
        --gdal-config gdal-config
%PYTHON% setup.py build_py
%PYTHON% setup.py build_scripts
%PYTHON% setup.py install

popd
