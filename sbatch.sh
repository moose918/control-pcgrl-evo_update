#!/bin/bash
#SBATCH --nodes=1
##SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=12

#SBATCH --partition=stampede
#SBATCH --time=72:00:00

#SBATCH --job-name=run_batch_evo

#SBATCH --output=/home-mscluster/mgumpu/control_pcgrl/logs/out_batch.log
#SBATCH --error=/home-mscluster/mgumpu/control_pcgrl/logs/err_batch.log


source /home-mscluster/mgumpu/.bashrc
cd /home-mscluster/mgumpu/control_pcgrl || exit

# We try to activate the relevant conda environment below.
conda activate pcgrl
#
#python3 run_batch_evo.py --local || exit
#python3 run_batch_evo.py --local --evaluate || exit
#python3 run_batch_evo.py --local --cross-eval || exit

python3 run_batch_evo.py || exit
python3 run_batch_evo.py --evaluate || exit
python3 run_batch_evo.py --cross-eval || exit