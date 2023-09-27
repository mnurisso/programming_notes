For little projects a README file is enough.

A checklist of what may be needed in a documentation, depending on the size of the project is (from [CodeRefinery](https://coderefinery.github.io/documentation/wishlist/)):

- Purpose
- Authors
- License
- Recommended citation
- Copy-paste-able example to get started
- Dependencies and their versions or version ranges
- Installation instructions
- Tutorials covering key functionality
- Reference documentation (e.g. API) covering all functionality
- How do you want to be asked questions (mailing list or forum or chat or issue tracker)
- Possibly a FAQ section
- Contribution guide

You want to keep the documentation under version control, so that you can see how it evolved over time.

## Incode documentation

Incode documentation is documentation that is written in the code itself.
It is usually written in the form of comments and docstrings.
It is very useful because from docstrings you can generate documentation automatically.
At the same time, it is very possible that docstrings alone are not enough to explain the code to a new user.

### Good practices

- Comment your code. A good comment should explain why the code is there, not what it does.
- Don't use zombie code. If you have commented out code and you don't want to lose the info, add a comment explaining why the code was modified.

## README file

Even if you think your project is small, you should have a README file.
On the other hand, if your project is big, you should have a README file anyway, eventually with links to other documentation and an explanation of the structure of the project.

A very good guide can be found [here](https://www.makeareadme.com/).

On GitHub the README file is shown on the main page of the repository.
A Table of Content is automatically generated if you use the right syntax.

## rst versus md

An example of the same content in rst and md:

```
# This is a section in Markdown   This is a section in RST
                                  ========================

## This is a subsection           This is a subsection
                                  --------------------

Nothing special needed for        Nothing special needed for
a normal paragraph.               a normal paragraph.

                                  ::

    This is a code block          This is a code block


**Bold** and *emphasized*.        **Bold** and *emphasized*.

A list:                           A list:
- this is an item                 - this is an item
- another item                    - another item

There is more: images,            There is more: images,
tables, links, ...                tables, links, ...

```

Pandoc can convert from one format to the other.

## Sphinx

Sphinx is a tool that can be used to generate documentation from docstrings and can be used to generate documentation in different formats, including HTML and PDF, starting from reStructuredText (rst) files.

It is now the standard tool for Python documentation and it can be hosted on [Read the Docs](https://readthedocs.org/) for free.

Check [here](https://coderefinery.github.io/documentation/sphinx/) for a tutorial on how to use Sphinx.

A typical solution to automatically deploy the documentation on Read the Docs is to use GitHub Actions.

An example from [here](https://coderefinery.github.io/documentation/gh_workflow/) deploying the documentation on GitHub Pages:

```yaml
name: documentation

on: [push, pull_request, workflow_dispatch]

permissions:
  contents: write

jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v3
      - name: Install dependencies
        run: |
          pip install sphinx sphinx_rtd_theme myst_parser
      - name: Sphinx build
        run: |
          sphinx-build doc _build
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        if: ${{ github.event_name == 'push' && github.ref == 'refs/heads/main' }}
        with:
          publish_branch: gh-pages
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: _build/
          force_orphan: true
```

## Doxygen

If you are writing C or C++ code, you can use Doxygen to generate documentation from docstrings.
The support is there also for Fortran, Python and Java.

## Jupyter notebooks

Jupyter notebooks are a very good tool to document your code.
They allow you to write code and documentation in the same file.
They are very useful to show how to use your code and to allow users to play with your code, changing parameters and seeing the results.