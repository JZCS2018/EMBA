#!/bin/bash
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_small_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-computers-small/1104_185207/model_best.pth
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-computers-medium/1104_171913/model_best.pth
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_large_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-computers-large/1104_133021/model_best.pth
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-computers-xlarge/1104_061637/model_best.pth


##### Watch####
python test_joint.py --device 0 -c configs/BERT/watches/config_watches_small_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-watches-small/1104_060401/model_best.pth
python test_joint.py --device 0 -c configs/BERT/watches/config_watches_medium_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-watches-medium/1104_045548/model_best.pth
python test_joint.py --device 0 -c configs/BERT/watches/config_watches_large_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-watches-large/1104_011945/model_best.pth
python test_joint.py --device 0 -c configs/BERT/watches/config_watches_xlarge_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-watches-xlarge/1103_201332/model_best.pth

### Shoes####
python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_small_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-shoes-small/1103_195147/model_best.pth
python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_medium_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-shoes-medium/1103_193223/model_best.pth
python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_large_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-shoes-large/1103_190340/model_best.pth
python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_xlarge_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-shoes-xlarge/1103_182044/model_best.pth


### cameras###
python test_joint.py --device 0 -c configs/BERT/cameras/config_cameras_small_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-cameras-small/1105_032229/model_best.pth
python test_joint.py --device 0 -c configs/BERT/cameras/config_cameras_medium_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-cameras-medium/1105_022653/model_best.pth
python test_joint.py --device 0 -c configs/BERT/cameras/config_cameras_large_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-cameras-large/1105_000853/model_best.pth
python test_joint.py --device 0 -c configs/BERT/cameras/config_cameras_xlarge_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-cameras-xlarge/1104_190558/model_best.pth

### abtbuy###
python test_joint.py --device 0 -c configs/BERT/abtbuy/config_abtbuy_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-abtbuy/1105_033324/model_best.pth

### dblpscholar ##
python test_joint.py --device 0 -c configs/BERT/dblpscholar/config_dblpscholar_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-dblpscholar/1105_205027/model_best.pth

# ### monitor ###
# python test_joint.py --device 0 -c configs/BERT/monitor/config_monitor_joint_test.json --resume saved/models/JointBERT-FT-monitor/0914_171244/model_best.pth

### company ###
python test_joint.py --device 0 -c configs/BERT/company/config_company_joint_test.json --resume saved/ABLavg_CLS/models/JointBERT-FT-company/1105_034707/model_best.pth