# meng_slurm_tutorial



### Check the status of nodes

add the following command to ~/.bashrc

```bash
freegpu() {
    python3 /work/alanpham/freegpu.py
}
export PATH="/work/gpustat/bin:$PATH"
```

------



### To run an interative bash session:

```bash
srun --nodelist={node_name} -t 60:00 --pty bash
```

------



### Submit a slurm job

#### Write a slurm script

```bash
#!/bin/bash
#SBATCH -p rise                                      # partition (queue)     
#SBATCH -N 1                                         # number of nodes requested
#SBATCH -n 1                                         # number of tasks (i.e. processes) requested
#SBATCH --cpus-per-task=6                            # number of cores per task
#SBATCH --gres=gpu:1                                 # request 1 of any kind of gpu per node
##SBATCH --exclude=havoc,r4,r16,atlas                # This line is comment.  
#SBATCH --nodelist=pavia                             # if you need specific nodes
#SBATCH -t 0-12:00                                   # time requested (D-HH:MM) 
#SBATCH -D /home/eecs/yefan0726                      # slurm will cd to this directory before running the script

# The following are bash commands
echo starting job...
source ~/.bashrc
conda activate your_env
cd ~/your_folder
# start your experiments
python main.py 
```



#### Submit a slurm script

```bash
sbatch -o /home/eecs/yefan0726/slurm_output.log /home/eecs/yefan0726/submission_script.sh
```



#### Monitor the status of jobs

```bash
squeue 
squeue -u username
squeue --format="%.8i %.4P %100j %10u %.8T %.12M %12N"
```



#### Cancel the job

```bash
scancel jobID  (e.g. 30334 or {30334..30339})
scancel -u username
```

