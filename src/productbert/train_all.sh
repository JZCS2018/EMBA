# #!/bin/bash

# python train.py --device 0 -m AOA/ -c configs/BERT/shoes/config_shoes_xlarge_joint.json --lr 3e-5
python train.py --device 0 -m AOA/ -c configs/BERT/shoes/config_shoes_xlarge_joint.json --lr 5e-6
python train.py --device 0 -m AOA/ -c configs/BERT/shoes/config_shoes_xlarge_joint.json --lr 2e-6

# # python train.py --device 0 -c configs/BERT/watches/config_watches_large_joint.json --lr 3e-5
# # python train.py --device 0 -c configs/BERT/watches/config_watches_large_joint.json --lr 8e-5
# python train.py --device 0 -c configs/BERT/watches/config_watches_large_joint.json --lr 1e-4

# # python train.py --device 0 -c configs/BERT/watches/config_watches_xlarge_joint.json --lr 3e-5
# python train.py --device 0 -c configs/BERT/watches/config_watches_xlarge_joint.json --lr 8e-5
# python train.py --device 0 -c configs/BERT/watches/config_watches_xlarge_joint.json --lr 1e-4

# python train.py --device 0 -c configs/BERT/shoes/config_shoes_large_joint.json --lr 3e-5
python train.py --device 0 -m AOA/ -c configs/BERT/shoes/config_shoes_large_joint.json --lr 5e-6
python train.py --device 0 -m AOA/ -c configs/BERT/shoes/config_shoes_large_joint.json --lr 2e-6

# # python train.py --device 0 -c configs/BERT/watches/config_watches_medium_joint.json --lr 3e-5
# python train.py --device 0 -c configs/BERT/watches/config_watches_medium_joint.json --lr 8e-5
# python train.py --device 0 -c configs/BERT/watches/config_watches_medium_joint.json --lr 1e-4

# # python train.py --device 0 -c configs/BERT/watches/config_watches_small_joint.json --lr 3e-5
# python train.py --device 0 -c configs/BERT/watches/config_watches_small_joint.json --lr 8e-5
# python train.py --device 0 -c configs/BERT/watches/config_watches_small_joint.json --lr 1e-4

# python train.py --device 0 -m AOA/ -c configs/BERT/shoes/config_shoes_medium_joint.json --lr 8e-5
python train.py --device 0 -m AOA/ -c configs/BERT/shoes/config_shoes_medium_joint.json --lr 5e-6
# python train.py --device 0 -m AOA/ -c configs/BERT/shoes/config_shoes_medium_joint.json --lr 1e-4

# python train.py --device 0 -c configs/BERT/shoes/config_shoes_small_joint.json --lr 8e-5
# python train.py --device 0 -c configs/BERT/shoes/config_shoes_small_joint.json --lr 1e-4


# python train.py --device 0 -c configs/BERT/dblpscholar/config_dblpscholar_joint.json --lr 3e-5
# python train.py --device 0 -c configs/BERT/dblpscholar/config_dblpscholar_joint.json --lr 8e-5
# python train.py --device 0 -c configs/BERT/dblpscholar/config_dblpscholar_joint.json --lr 1e-4

python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 1e-4