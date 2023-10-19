#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16

## We won't be asking for gpus, for now
##SBATCH --gres=gpu:1

#SBATCH --time=72:00:00
#SBATCH --partition=stampede

#SBATCH --job-name=evopcg
##SBATCH --mail-type=BEGIN,END
##SBATCH --mail-user=se2161@nyu.edu
#SBATCH --error=/home-mscluster/mgumpu/control_pcgrl/logs/out_log.out
#SBATCH -output=/home-mscluster/mgumpu/control_pcgrl/logs/err_log.err

source /home-mscluster/mgumpu/.bashrc
cd /home-mscluster/mgumpu/control_pcgrl/ || exit
conda activate pcgrl

python evolve.py -la 0
