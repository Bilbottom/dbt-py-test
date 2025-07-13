# dbt-py-test

Manual test project for the [dbt-py](https://github.com/billwallis/dbt-py) package.

## How it works

This repo uses the [dbt-py](https://github.com/billwallis/dbt-py) package to inject custom Python into the dbt `modules` Jinja context.

As a minimal example, this repo just uses `requirements.txt` files and [setuptools](https://setuptools.pypa.io/en/latest/).

Some important notes:

- The project metadata is configured in the `tool.setuptools` table of the [pyproject.toml](pyproject.toml) file, and specifies that:
  - The (core) requirements live in the `requirements.txt` file
  - The custom Python exists in a directory called `custom_package` and `another_custom_package`
- Setuptools doesn't like the `-e .` specifier in the `requirements.txt` file, so when developing locally, install from the `requirements-dev.txt` file:
  - `pip install -r requirements-dev.txt --force-reinstall`

To run dbt with the custom python, we use the `dbt-py` CLI command. After configuring the injection (see below), we can run dbt commands like so:

```shell
dbt-py --help
dbt-py clean
dbt-py build

dbt-py run --select my_model
dbt-py test --select tag:unit-test
```

### Configuration (>=0.1.0)

The Python code lives in a custom directory, so we need to pass that information in via the `tools.dbt-py` section in the `pyproject.toml` file:

- https://github.com/billwallis/dbt-py-test/blob/a6b392c63056a6c21a5277d940639e6ecbc3f405/pyproject.toml#L25-L32

### Configuration (<0.1.0)

The Python code lives in a custom directory, so we need to pass that information in via the `DBT_PY_PACKAGE_ROOT` environment variable:

```shell
# Mac, Linux
export DBT_PY_PACKAGE_ROOT="custom_package"  # echo $DBT_PY_PACKAGE_ROOT

# Windows
set DBT_PY_PACKAGE_ROOT="custom_package"  # echo %DBT_PY_PACKAGE_ROOT%

# Windows PowerShell
$Env:DBT_PY_PACKAGE_ROOT="custom_package"  # echo $Env:DBT_PY_PACKAGE_ROOT
```
