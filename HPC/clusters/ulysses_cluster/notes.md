# Ulysses Guide

## Technical details

- OS: SISSA Linux 7 (CentOS/RHEL 7.7.1908)
- Nodes access: `frontend2.hpc.sissa.it`
- Storage: `quota` to check the actual usage
  - `/home`: 198 GiB
  - `/scratch`: 4950 GiB

## Partitions

- `regular`: 16 nodes, 12h max
- `long`: 8 nodes, 48h max
- `wide`: 32 nodes, 8h max
- `gpu`: 4 nodes, 12h max, 2 gpu per node

Partitions are divided in `1` and `2` with some differencies:

1. 4000 MB memory per node, 40 threads per node
2. 6350 MB memory per node, 64 threads per node

## Access the cluster

```bash
ssh mnurisso@frontend2.hpc.sissa.it`
```

If you need to access the cluster to use graphical software:

```bash
ssh -x mnurisso@frontend2.hpc.sissa.it
```

## Modules

To check the available modules:

```bash
module avail
```

You can load a specific module or the default one, marked with D in the list.
To check the loaded modules

```bash
module list
```

### Search for a module

```bash
module spider modulename
```

### Load a module

```bash
module load/unload modulename
```

## Job Script

To run a job script:

```bash
sbatch job_script.sh
```

### SLURM

To configure SLURM options:

```bash
#SBATCH --option=value
```

To ignore an option:

```bash
# to ignore options:
#[optional] #SBATCH 
#[unconfig] #SBATCH
```

#### CPU Resources Configuration

- `--ntasks=<value>`: MPI processes needed. `1` for serial jobs (they can still use OpenMP parallelism).

- `--cpus-per-task=<value>`: CPU threads per MPI task. Limited by the node capability.

- `[optional] --nodes=<value>`: SLURM can automatically determine the number of noded required

#### Memory Configuration

`--mem=<value>`: amount of memory per node. See the partition limits.

Optionally the memory can be specified per single cpu: `--mem-per-cpu=4000mb`. This is not compatible with the `-mem` option.

###  Modules

Load the needed modules and define and export some required quantity.

### Job Commands

Move into the right folder. `$SLURM_SUBMIT_DIR` is the folder in which the `send_job.sh` is located in the memory.

## Interactive jobs

```bash
srun --partition=regular1 --time=00:30:00 --cpus-per-task=1 --pty bash -i
```

## High priority

Is possible to ask for an high priority job, but the drowback is to have lower priority for the following jobs.

```bash
sbatch --qos=fastlane job.sh
sbatch --qos=priority1 job.sh #half priority of fastlane
```

