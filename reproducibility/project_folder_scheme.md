## Directory structure for projects

This is a suggested directory structure for projects. It is based on the [CodeRefinery workshop](https://coderefinery.github.io/reproducible-research/organizing-projects/). The idea is to have a consistent structure for all projects, so that it is easy to find things and to share projects with others.

```
project_name/
├── README.md             # overview of the project
├── data/                 # data files used in the project
│   ├── README.md         # describes where data came from
│   └── sub-folder/       # may contain subdirectories
├── processed_data/       # intermediate files from the analysis
├── manuscript/           # manuscript describing the results
├── results/              # results of the analysis (data, tables, figures)
├── src/                  # contains all code in the project
│   ├── LICENSE           # license for your code
│   ├── requirements.txt  # software requirements and dependencies
│   └── ...
└── doc/                  # documentation for your project
    ├── index.rst
    └── ...
```

- `src` should go under version control.
- A License file can be included in the `src` folder.
- The `requirements.txt` file or a `piproject.toml` should contain all the software dependencies needed to run the code in the project if the code it's written in python.
- The `doc` folder should contain a `index.rst` file that describes the project and how to run the code.
- The `README.md` file in the root folder should contain a short description of the project and how to install and run the code.