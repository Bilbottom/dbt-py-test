# dependencies
pip install -r requirements-dev.txt --force-reinstall


################################################################################
################################################################################

# use the default dbt-py package name, `custom`
dbt-py build

# use a custom name (Mac, Linux)
DBT_PY_PACKAGE_ROOT=custom_package dbt-py build

# use a custom name (Windows)
set DBT_PY_PACKAGE_ROOT=custom_package  # echo %DBT_PY_PACKAGE_ROOT%
dbt-py build

# use a custom name (Windows PowerShell)
$Env:DBT_PY_PACKAGE_ROOT="custom_package"  # echo $Env:DBT_PY_PACKAGE_ROOT
dbt-py build
