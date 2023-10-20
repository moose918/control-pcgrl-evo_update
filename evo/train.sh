#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=12

## We won't be asking for gpus, for now
##SBATCH --gres=gpu:1

#SBATCH --partition=stampede
#SBATCH --time=72:00:00


#SBATCH --job-name=evopcg
#SBATCH --error=/home-mscluster/mgumpu/control-pcgrl-evo_update/logs/run.out
#SBATCH -output=/home-mscluster/mgumpu/control-pcgrl-evo_update/logs/run.err

source /home-mscluster/mgumpu/.bashrc
cd /home-mscluster/mgumpu/control-pcgrl-evo_update/ || exit
conda activate pcgrl

start=$SECONDS
while ! python evo/evolve.py -la 23
do
    duration=$((( SECONDS - start ) / 60))
    echo "Script returned error after $duration minutes"
    if [ $duration -lt 60 ]
    then
      echo "Too soon. Something is wrong. Terminating node."
      exit 42
    else
      echo "Killing ray processes and re-launching script."
      ray stop
      pkill ray
      pkill -9 ray
      pkill python
      pkill -9 python
      start=$SECONDS
    fi
done
