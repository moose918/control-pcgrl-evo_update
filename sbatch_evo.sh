#!/bin/bash

sbatch sbatch_nca.sh &
sleep 100
sbatch sbatch_aux_nca.sh & 
sleep 100
sbatch sbatch_cppn.sh
