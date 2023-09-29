# Jupyter notebook

It is a tool that allows you to create and share documents that contain live code, equations, visualizations and explanatory text.
A computational narrative can be created in a file.

The notebooks make easy to share code and even to run it in a browser, with services like [Binder](https://mybinder.org/).

## Starting a notebook

To start a notebook, you can use the command:

```bash
jupyter notebook
```

It is recommended anyway to use Jupyter Lab, which is a more modern interface. To start it, you can use the command:

```bash
jupyter-lab
```

## Version control of notebooks

Jupyter Notebooks are stored in JSON format, which is not ideal for version control.
Run it again will make appear for git a lot of changes, even if you have not changed anything.

A tool for visualizing the changes in a notebook is [nbdime](https://nbdime.readthedocs.io/en/latest/).
Other tools may be present in your IDE, for example in VSCode.