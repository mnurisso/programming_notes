

# Anaconda

A faster version of conda, working with identical commands as described below, is **mamba**. 
We suggest to try this option.

To access a graphical interface to manage environment and launch utilities like **jupyter**:

```bash
anaconda-navigator
```

## Conda

If during the anaconda installation conda has not been activated:

```bash
source $HOME/anaconda3/bin/activate
```

Update conda with:

```bash
conda update conda
```

### Managing environments

Create a new environment with:

```bash
conda create --name env_name package_name
#example:
conda create --name snowflakes biopython
```

It can require to install additional packages, dependencies required by your packages.

#### Activate and deactivate

The environments can be activate and deactivate with:

```bash
conda activate env_name
conda activate #to go back to the base one
conda deactivate
```

To have the list of environments and paths:

```bash
conda info --envs
```

#### Different python versions

You can create environments with different versions of python:

```bash
conda create --name env_name python=2.7
```

A specific version of python can also be specified in a second moment, all the installed packages will be adapted to the required version of python (if available).

#### Managing packages

To look if a package is installed:

```bash
conda search package_name
```

To install it trough Anaconda repository:

```bash
conda install package_name
#pylab
conda install matplotlib
conda install scipy
```

If you want to see the list of installed packages:

```bash
conda list
```

#### Install custom packages

Move to the desired environment. Enter the local package folder, containing the **setup.py** file, then type:

```bash
pip install .
```

If some local package is modified you will simply need to reinstall the same package to override the previous one.

#### Delete an environment

```bash
conda env remove -n ENV_NAME
conda env remove --name ENV_NAME
```

#### Create an environment with a .yml file

The `environment.yml` file has to specify details of the packages, the environment name and the python version required.

```
name: envname
channels:
  - conda-forge
dependencies:
  - python>=3.9,<3.11
  - pyYAML
  - xarray
  - pip
  - pip:
    - sparse
    - git+https://github.com/jhardenberg/smmregrid.git
```

In this example a range of python versions is specified and some custom package that requires a download from a git repository has been added.

```bash
conda env create -f environment.yml
```