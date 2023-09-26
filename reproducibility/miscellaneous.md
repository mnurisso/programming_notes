## Binder

[Binder](https://mybinder.org/) is a free online service that allows you to run Jupyter notebooks in the cloud without any installation. You can use it to share your notebooks with others or to make your code reproducible by others. The user can then interact with the notebook in the browser. You can use it to run your own notebooks or to create a custom Binder service for your organization.

## Conda

[Conda](https://docs.conda.io/en/latest/) is an open source package management system and environment management system that runs on Windows, macOS and Linux.
Conda quickly installs, runs and updates packages and their dependencies.
Conda easily creates, saves, loads and switches between environments on your local computer. It was created for Python programs, but it can package and distribute software for any language.

Check the `conda` folder in this repository for more information.

## Snakemake

[Snakemake](https://snakemake.readthedocs.io/en/stable/) is a workflow management system that aims to reduce the complexity of creating workflows by providing a fast and comfortable execution environment, together with a clean and modern specification language in python style.
Snakemake workflows are essentially Python scripts extended by declarative code to define rules.
Rules describe how to create output files from input files. This declarative approach allows to easily define parallel and sequential execution of workflows, which are automatically parallelized and optimized by Snakemake.
Snakemake workflows can be seamlessly scaled to server, cluster, grid and cloud environments without the need to modify the workflow definition.
Finally, Snakemake workflows can entail a description of required software, which will be automatically deployed to any execution environment.
This allows to create self-contained workflows that are independent of the installation of software dependencies.

### Workflow example

Example from [CodeRefinery](https://coderefinery.github.io/reproducible-research/workflow-management/):

```python
# a list of all the books we are analyzing
DATA = glob_wildcards('data/{book}.txt').book

rule all:
    input:
        expand('statistics/{book}.data', book=DATA),
        expand('plot/{book}.png', book=DATA)

# count words in one of our books
rule count_words:
    input:
        script='statistics/count.py',
        book='data/{file}.txt'
    output: 'statistics/{file}.data'
    conda: 'environment.yml'
    log: 'statistics/{file}.log'
    shell: 'python {input.script} {input.book} > {output}'

# create a plot for each book
rule make_plot:
    input:
        script='plot/plot.py',
        book='statistics/{file}.data'
    output: 'plot/{file}.png'
    conda: 'environment.yml'
    log: 'plot/{file}.log'
    shell: 'python {input.script} --data-file {input.book} --plot-file {output}'
```

It can be run with:

```bash
snakemake --delete-all-output -j 1 
```

Since version 5.11 we need to specify the number of cores or jobs using `-j` or `--cores` option.
The `--delete-all-output` option is used to delete all output files before running the workflow.

If then we execute the same command again, Snakemake will not run the workflow again because the output files already exist.

### Visualize the workflow

Snakemake can generate a directed acyclic graph (DAG) of the workflow.
This is useful to understand the workflow and to debug it.

```bash
snakemake -j 1 --dag | dot -Tpng > dag.png
```