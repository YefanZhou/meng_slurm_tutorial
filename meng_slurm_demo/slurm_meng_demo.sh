#!/bin/bash
#SBATCH -p rise # partition (queue)
#SBATCH --nodelist=bombe
#SBATCH -n 1 # number of tasks (i.e. processes)
#SBATCH --cpus-per-task=6 # number of cores per task
#SBATCH --gres=gpu:1
#SBATCH -t 0-12:00 # time requested (D-HH:MM)
pwd
hostname
date
echo starting job...


cd ~/meng_slurm_demo 
python main.py
