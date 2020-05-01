#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --partition=gpu_titanrtx_shared
#SBATCH --gres=gpu:1
#SBATCH --mem=16000M
#SBATCH --cpus-per-task=1
#SBATCH --job-name=test
#SBATCH --output=out_files/test_ghs_flopcount.out
source activate base

python main.py --model resnet18 --dataset cifar10 -bs 128 -tbs 5000 -e 10 -lr 0.1 \
                --opt sgd --momentum 0.9 --reg_type wdecay --lambda 5e-4 --use_scheduler \
                --milestones 150 250 \
                --prune_criterion threshold --prune_freq 5 --magnitude_threshold 1e-4 \
                --add_ghs --hoyer_lambda 2e-4 --stop_hoyer_at 5 \
                --seed 42 \
                --comment=test \
                --logdir=test