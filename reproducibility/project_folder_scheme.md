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