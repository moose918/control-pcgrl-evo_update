#!/bin/bash
#SBATCH --nodes=1
##SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16

#SBATCH --partition=bigbatch
#SBATCH --time=72:00:00

#SBATCH --job-name=cppn_batch

#SBATCH --output=/home-mscluster/mgumpu/control-pcgrl-evo_update/logs/cppn_out.log
#SBATCH --error=/home-mscluster/mgumpu/control-pcgrl-evo_update/logs/cppn_err.log


source /home-mscluster/mgumpu/.bashrc
cd /home-mscluster/mgumpu/control-pcgrl-evo_update || exit
cp ./configs/evo/batch_CPPN.yaml ./configs/evo/batch.yaml

# We try to activate the relevant conda environment below.
conda activate pcgrl

python run_batch_evo.py --local || exit
python run_batch_evo.py --local --evaluate || exit
python run_batch_evo.py --local --cross-eval || exit

#python run_batch_evo.py || exit
#python run_batch_evo.py --evaluate || exit
#python run_batch_evo.py --cross-eval || exit
