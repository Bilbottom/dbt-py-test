# dbt-py-test

Manual test project for the [dbt-py](https://github.com/billwallis/dbt-py) package.

## How it works

This repo uses the [dbt-py](https://github.com/billwallis/dbt-py) package to inject custom Python into the dbt `modules` Jinja context.

As a minimal example, this repo just uses `requirements.txt` files and [setuptools](https://setuptools.pypa.io/en/latest/).

Some important notes:

- The project metadata is configured in the `tool.setuptools` table of the [pyproject.toml](pyproject.toml) file, and specifies that:
  - The (core) requirements live in the `requirements.txt` file
  - The custom Python exists in a directory called `custom_package`
- Setuptools doesn't like the `-e .` specifier in the `requirements.txt` file, so when developing locally, install from the `requirements-dev.txt` file:
  - `pip install -r requirements-dev.txt --force-reinstall`

To run dbt with the custom python, we use the `dbt-py` CLI command. The Python code lives in a custom directory, so we also need to pass that information in via the `DBT_PY_PACKAGE_ROOT` environment variable which we can set in a shell:

```shell
# Mac, Linux
export DBT_PY_PACKAGE_ROOT="custom_package"  # echo $DBT_PY_PACKAGE_ROOT

# Windows
set DBT_PY_PACKAGE_ROOT="custom_package"  # echo %DBT_PY_PACKAGE_ROOT%

# Windows PowerShell
$Env:DBT_PY_PACKAGE_ROOT="custom_package"  # echo $Env:DBT_PY_PACKAGE_ROOT
```

Then we can use any dbt command via the `dbt-py` command:

```shell
dbt-py --help
dbt-py clean
dbt-py build

dbt-py run --select my_model
dbt-py test --select tag:unit-test
```
