#!/bin/bash
python train.py --device $1 -c configs/BERT/computers/config_computers_large_joint.json --lr 1e-4
python train.py --device $1 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 1e-4
