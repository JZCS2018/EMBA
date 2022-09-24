#!/bin/bash

python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 3e-5
python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 8e-5
python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 1e-4

python train.py --device 0 -c configs/BERT/cameras/config_cameras_xlarge_joint.json --lr 3e-5
python train.py --device 0 -c configs/BERT/cameras/config_cameras_xlarge_joint.json --lr 8e-5
python train.py --device 0 -c configs/BERT/cameras/config_cameras_xlarge_joint.json --lr 1e-4