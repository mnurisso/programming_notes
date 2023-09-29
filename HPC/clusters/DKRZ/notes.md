# DKRZ cluster

(mixed notes from https://docs.dkrz.de/doc/getting_started/index.html)

To access Levante:
```bash
ssh -X <userid>@levante.dkrz.de
```

There are multiple login nodes (0-6).  Any process that uses more than 10% of the login node's memory will be killed automatically.

## Public key

Access can be done with a public key authentication. 
First generate the password with the `ed25519` key:

```bash
ssh-keygen -t ed25519
```

It will create two files named `id_ed25519` and `id_ed25519.pub`.

## Bash shell

 A *login* bash shell looks for `.bash_profile`, `.bash_login` or `.profile` in your home directory and executes commands from the first file found. A *non-login* bash shell or bash subshell reads `.bashrc` file.

## Module management

Each modulefile is named following the below pattern:

```bash
pkg.name/pkg.version-^mpi.name-^mpi.version-compiler.name-compiler.version
```

If only the `<modname>` (i.e. without `<version>`) is supplied to the `module` command, the lexicographically highest version or one marked as default explicitly is loaded.

`man module` can provide a detailed description of the module commands. The most common are here listed:

- `module avail`: Shows the list of all available modules
- `module show <modulefile>`: Shows the effect of loading the module `<modulefile>` on your environment. For a deeper insight into the software dependencies, please use the spack command as described below.
- `module load <modulefile>`: Loads selected module; a default or lexicographically highest version is chosen, if only `<modname>` without `<version>` is specified
- `module list`: Lists all modules currently loadedv
- `module rm <modulefile>`: Unloads module` <modname>/<version>`
- `module swap <modulefile1> <modulefile2>`: Switches loaded module` <modulefile1>` to` <modulefile2>` (mainly used to switch to a different version of software)
- `module purge`: Unloads all modules
- `module apropos <keyword>`: Scans the available module files for the specified keyword and list all matching modules

To use the module command in a script you have the following file before any invocation of the module command:

```bash
source /sw/etc/profile.levante
```

## Filesystem

- `HOME`: for setup files, source codes and scripts. It is stored on SSD and backed up, with 30 GiB available.
`/home/[a,b,g,k,m,u]/<userid>`
- `WORK`: space shared between all the users of a project. Can store large amount of data but it is not backed up.
`/work/<projectid>`
- `SCRATCH`: for temporary data. Old data are automatically deleted, they are guaranteed only for 14 days. Every users has 15 TiB available.
`/scratch/[a,b,g,k,m,u]/<userid>`

## Queue system (SLURM)

A `SLURM` queue system is present (see Ulysses notes for a basic usage or the DKRZ website https://docs.dkrz.de/doc/levante/running-jobs/slurm-introduction.html#levante-slurm-introduction).

A list of the available partitions can be displayed with the `sinfo` command.

Examples of simple batch script to run `SLURM` for different configurations can be found here:
https://docs.dkrz.de/doc/levante/running-jobs/example-batch-scripts.html

## Remote file system

It is possible to interact with the Levante file system as it is your local file system.
A newly created directory located locally at `~/levante_home`. The remote directory that is mounted in this case is the home directory on Levante.

```bash
# create mount point
$ mkdir -p ~/levante_home
# mount the remote directory to the mount point
$ sshfs -o idmap=user m123456@levante.dkrz.de:/home/m/m123456 ~/levante_home
```

After successfully mounting the remote file system, the directories and files are accessible as if they were on the local file system.
After work is done, the remote file system should be unmounted.

```bash
# unmount remote directory
$ fusermount -u ~/levante_home
```