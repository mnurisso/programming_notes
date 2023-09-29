# Why to test?

Automatic way to check if the code is working as expected are great to avoid that a change in the code breaks something else without noticing it.
Making tests makes the code easy to mantain and to further develop.

Two usually used types of tests are:
- **Unit tests**: test small parts of the code, like functions.
- **Integration tests**: test whole chunks of code.
- **End-to-end tests**: test the whole code.

The more you go towards the end-to-end tests, the less you're testing all the little details of the code.

An extreme can even be to write the tests first and then the code passing the tests.
This is called [test-driven development](https://en.wikipedia.org/wiki/Test-driven_development).

## Test on python

We will use the [pytest](https://docs.pytest.org/en/stable/) library.
To test your code automatically, you may want to have your code on github or gitlab.

### Test example

Let's create a file `test.py` with the following content (from [CodeRefinery](https://coderefinery.github.io/testing/motivation/)):

```python
def fahrenheit_to_celsius(temp_f):
    """Converts temperature in Fahrenheit
    to Celsius.
    """
    temp_c = (temp_f - 32.0) * (5.0/9.0)
    return temp_c

# This is the test function: `assert` raises an error if something
# is wrong.
def test_fahrenheit_to_celsius():
    temp_c = fahrenheit_to_celsius(temp_f=100.0)
    expected_result = 37.777777
    assert abs(temp_c - expected_result) < 1.0e-6
```

Notice that the test function starts with `test_` and that the `assert` statement is used to check if the result is as expected.

To run the test, you can use the command:

```bash
pytest test.py
```

The flag `-v` can be used to get more information about the test, with a more verbose output.

## Automatic testing

Tests can be run automatically, for example when you push your code to github or gitlab.
This is done using [github actions](https://docs.github.com/en/actions) or [gitlab CI](https://docs.gitlab.com/ee/ci/).
Github actions are free for public repositories, while a maximum amount of minutes is available for private repositories.

Github actions are defined in a yaml file in the folder `.github/workflows/`.
An example is given in the next section.

### Github actions

Here we give an example of how to run the tests automatically on github, taken from [CodeRefinery](https://coderefinery.github.io/testing/continuous/integration/).

```yaml
name: Python package

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    permissions:
      contents: read
      pull-requests: write

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: Set up Python 3.10
      uses: actions/setup-python@v3
      with:
        python-version: "3.10"
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        python -m pip install flake8 pytest pytest-cov
        if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
    - name: Lint with flake8
      run: |
        # stop the build if there are Python syntax errors or undefined names
        flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
        # exit-zero treats all errors as warnings. The GitHub editor is 127 chars wide
        flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
    - name: Test with pytest and calculate coverage
      run: |
        pytest --cov-report "xml:coverage.xml"  --cov=.
    - name: Create Coverage
      if: ${{ github.event_name == 'pull_request' }}
      uses: orgoro/coverage@v3
      with:
          coverageFile: coverage.xml
          token: ${{ secrets.GITHUB_TOKEN }}
``````