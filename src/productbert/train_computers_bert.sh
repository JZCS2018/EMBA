#!/bin/bash

# python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 1e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 5e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 3e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 8e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 1e-4
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 1e-5
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 1e-5
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 5e-5
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 5e-5
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 3e-5
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 3e-5
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 8e-5
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 8e-5
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 1e-4
# # python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint.json --lr 1e-4
# python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint.json --lr 1e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint.json --lr 5e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint.json --lr 3e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint.json --lr 8e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint.json --lr 1e-4
# python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 1e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 5e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 3e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 8e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 1e-4
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 1e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 1e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 5e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 5e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 3e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 3e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 8e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 8e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 1e-4
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint.json --lr 1e-4

# python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 1e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 5e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 3e-5
# python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 8e-5
python train.py --sdirname AOA/ --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 1e-4
python train.py --sdirname AOA/ --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 5e-4
python train_random.py --sdirname AOA/ --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 1e-4
python train_random.py --sdirname AOA/ --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 5e-4

# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 1e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 1e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 5e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 5e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 3e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 3e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 8e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 8e-5
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 1e-4
# python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint.json --lr 1e-4
##############################################################
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 1e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 5e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 3e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 8e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_BT.json --lr 1e-4
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 1e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 5e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 3e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 8e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_small_joint_BT.json --lr 1e-4
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 1e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 5e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 3e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 8e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_BT.json --lr 1e-4
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 1e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 5e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 3e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 8e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_BT.json --lr 1e-4
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 1e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 5e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 3e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 8e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_BT.json --lr 1e-4
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 1e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 5e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 3e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 8e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_large_joint_BT.json --lr 1e-4
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 1e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 5e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 3e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 8e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_BT.json --lr 1e-4
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 1e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 5e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 3e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 8e-5
#python train.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 1e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 5e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 3e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 8e-5
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 1e-4
#python train_random.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_BT.json --lr 1e-4