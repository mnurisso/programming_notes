Notes based on [CodeRefinery's](https://coderefinery.github.io/reproducible-research/environments/) workshop.

## Introduction

Containers are a way to package software in a way that it can be run in a consistent way in different environments.
The execution of the software is isolated from the host operating system and the software dependencies are bundled with the software.
The instructions to build a container are written in a file called `Dockerfile` or `Singularity` file.

Popular containerization tools are [Docker](https://www.docker.com/) and [Singularity](https://sylabs.io/singularity/).
Docker images can be converted to Singularity images and vice versa.

Images can be found and shared in [Docker Hub](https://hub.docker.com/).