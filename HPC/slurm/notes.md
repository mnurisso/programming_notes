# SLURM Cheat Sheet for HPC Users

## What is SLURM?
SLURM (Simple Linux Utility for Resource Management) is a powerful and flexible workload manager used in HPC (High-Performance Computing) environments to schedule and manage jobs. It provides job queuing, job prioritization, and resource allocation across compute nodes.

## Basic SLURM Commands

### Job Submission
- **Submit a job:** `sbatch script.sh`
- **Run an interactive job:** `srun --ntasks=1 --time=01:00:00 --pty bash`
- **Submit an array job:** `sbatch --array=1-10 script.sh`
- **Submit a job with dependencies:** `sbatch --dependency=afterok:<job_id> script.sh`

### Job Monitoring
- **Check job status:** `squeue -u $USER`
- **Cancel a job:** `scancel <job_id>`
- **Check detailed job info:** `scontrol show job <job_id>`
- **Check cluster status:** `sinfo`
- **Monitor job efficiency:** `sacct -j <job_id> --format=JobID,Elapsed,MaxRSS,State`

### Job Scripts
#### Basic SLURM Script Example
```bash
#!/bin/bash
#SBATCH --job-name=myjob
#SBATCH --output=output.log
#SBATCH --error=error.log
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

module load python
python my_script.py
```

### Job Resources
- **Nodes:** `--nodes=<n>` (Specifies the number of nodes needed)
- **Tasks per node:** `--ntasks-per-node=<n>` (Defines how many tasks should be run per node)
- **CPUs per task:** `--cpus-per-task=<n>` (Allocates CPUs for each task)
- **Memory:** `--mem=<size>` (Total memory allocated for the job)
- **Memory per CPU:** `--mem-per-cpu=<size>` (Specifies memory allocated per CPU)
- **Time limit:** `--time=HH:MM:SS` (Defines the maximum runtime for the job)

### Logs & Troubleshooting
- **View job output/error logs:** `cat output.log` or `cat error.log`
- **Check job history:** `sacct -u $USER`
- **Check node status:** `scontrol show node <node_name>`
- **Investigate failed jobs:** `sacct -X --format=JobID,JobName%20,State,ExitCode -j <job_id>`
- **Get job efficiency details:** `seff <job_id>`

### SLURM Partitions
SLURM clusters often have multiple partitions (or queues) that categorize nodes based on their capabilities.
- **List partitions:** `sinfo -s`
- **Specify partition in job script:** `#SBATCH --partition=<partition_name>`
- **Check partition details:** `scontrol show partition <partition_name>`

### Job Dependencies
Job dependencies allow a job to start only after another job completes successfully.
- **Submit a dependent job:** `sbatch --dependency=afterok:<job_id> script.sh`
- **Types of dependencies:**
  - `after:<job_id>` - Starts after a job begins execution.
  - `afterok:<job_id>` - Starts only if the specified job finishes successfully.
  - `afternotok:<job_id>` - Starts if the specified job fails.
  - `afterany:<job_id>` - Starts after the specified job completes, regardless of outcome.

### Miscellaneous
- **Check available modules:** `module avail`
- **Load a module:** `module load <module_name>`
- **Unload a module:** `module unload <module_name>`
- **List loaded modules:** `module list`

---
For more details, check `man sbatch`, `man srun`, or your HPC documentation.

