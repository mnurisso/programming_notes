## What's DVC

[Data Version Control](https://dvc.org/) (DVC) is a tool that allows to embed in a git repository `.dvc` files which contains metadata necessary to keep under version control and retrieve data of any size.

A mix of actual files under version control and `.dvc` files can be included in the same repository.
A `.dvc` file is:

`filename.ext.dvc`

where internally this file contains the MD5, name, retrieve info (remote) and other metadata.

## Initialization

We need first to initialize a git repository and then the dvc initialization:

```bash
git init
dvc init
```

The second command initializes DVC in the repository, creating the necessary directory structure and configuration files. A `.dvc/.gitignore` file is created to ensure that the DVC cache and other temporary files are not tracked by Git. A second file `.dvc/config` is created to store the DVC configuration setting, such as remote storage locations.

## Original data storage

You can upload DVC-tracked data to a variety of storage systems (remote or local) referred to as "remotes".

Files can be in:
- **remote** (ssh, s3, ...): protected, to be accessed only to download the data retrieved
- **cache**: local copy that can contain full or partial amount of data, ideally to be shared among users and shouldn't be the only copy of data, a remote to recover data should exist for safety

## Add new files to DVC

- Move the target file in the repository, for example `test.file`.
- Add the file to the cache with `dvc add test.file`. This will add the file to the cache, the file in the `.gitignore` and create the `test.file.dvc` to be commited.
- `dvc push -r my_remote` will then push to the remote. It is possible to configure a default one in the `.dvc/config` file.
- the file `.dvc` can be push to the git repo

### Automatic commit to git

This configuration allows to automatically add to the staging area any changes made to the DVC-tracked files.
Also updates accordingly the `.gitignore` file.

```bash
dvc config core.autostage true
```

## File retrieval

If a user need a file they can simply do:

```bash
dvc checkout
```

this will create a symbolic link from the cache to the target folder. If a remote is available and the cache do not include this file, the cache will be populated with this file.

To configure a cache:

```bash
dvc config --local cache.dir /path/to/cache
```

This can be easily shared among different users.

## Deployment

`dvc pull` will simply deploy the files in cache and create the necessary links.
It is also possible to pull only specific files or directories by specifying their paths:

```bash
dvc pull path/to/file
```
