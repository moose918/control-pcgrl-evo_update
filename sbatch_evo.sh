#!/bin/bash
#SBATCH --nodes=1
##SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=12

#SBATCH --partition=stampede
#SBATCH --time=72:00:00

#SBATCH --job-name=evo_batch

#SBATCH --output=/home-mscluster/mgumpu/control-pcgrl-evo_update/logs/out.log
#SBATCH --error=/home-mscluster/mgumpu/control-pcgrl-evo_update/logs/err.log


source /home-mscluster/mgumpu/.bashrc
cd /home-mscluster/mgumpu/control-pcgrl-evo_update || exit

# We try to activate the relevant conda environment below.
conda activate pcgrl

sbatch sbatch_aux_nca.sh & sbatch sbatch_nca.sh & sbatch sbatch_cppn.sh