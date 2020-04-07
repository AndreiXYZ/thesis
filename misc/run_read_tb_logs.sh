#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -N 1
#SBATCH -p gpu_titanrtx_shared
#SBATCH --mem=16000M
#SBATCH --gres=gpu:1
#SBATCH --output misc/renset18_prune_bnorm_stats.txt

source activate base

python misc/read_tb_logs.py --log_folder runs/criterion_experiment_prune_bnorm/resnet18