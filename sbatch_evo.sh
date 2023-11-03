#!/bin/bash

sbatch sbatch_nca.sh &
sleep 10
sbatch sbatch_aux_nca.sh & 
sleep 10
sbatch sbatch_cppn.sh
