#!/bin/bash
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_small_joint_test.json --resume saved/SurfCon/models/JointBERT-FT-computers-small/1117_061731/model_best.pth
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_test.json --resume saved/SurfCon/models/JointBERT-FT-computers-medium/1117_031849/model_best.pth
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_large_joint_test.json --resume saved/SurfCon/models/JointBERT-FT-computers-large/1116_184238/model_best.pth
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_test.json --resume saved/SurfCon/models/JointBERT-FT-computers-xlarge/1116_040739/model_best.pth

python test_joint.py --device 0 -c configs/BERT/computers/config_computers_small_joint_test.json --resume saved/SurfCon/models/JointBERT-FT-computers-small/1117_070302/model_best.pth
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_medium_joint_test.json --resume saved/SurfCon/models/JointBERT-FT-computers-medium/1117_050736/model_best.pth
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_large_joint_test.json --resume saved/SurfCon/models/JointBERT-FT-computers-large/1116_224757/model_best.pth
python test_joint.py --device 0 -c configs/BERT/computers/config_computers_xlarge_joint_test.json --resume saved/SurfCon/models/JointBERT-FT-computers-xlarge/1116_100612/model_best.pth


# #### Watch####
# python test_joint.py --device 0 -c configs/BERT/watches/config_watches_small_joint_test.json --resume saved/models/JointBERT-FT-watches-small/0914_170645/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/watches/config_watches_medium_joint_test.json --resume saved/models/JointBERT-FT-watches-medium/0914_172106/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/watches/config_watches_large_joint_test.json --resume saved/models/JointBERT-FT-watches-large/0914_180729/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/watches/config_watches_xlarge_joint_test.json --resume saved/models/JointBERT-FT-watches-xlarge/0914_211601/model_best.pth

### Shoes####
# python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_small_joint_test.json --resume saved/models/JointBERT-FT-shoes-small/0914_170532/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_medium_joint_test.json --resume saved/models/JointBERT-FT-shoes-medium/0914_171913/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_large_joint_test.json --resume saved/models/JointBERT-FT-shoes-large/0914_180509/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_xlarge_joint_test.json --resume saved/models/JointBERT-FT-shoes-xlarge/0914_221345/model_best.pth

### abtbuy###
# python test_joint.py --device 0 -c configs/BERT/abtbuy/config_abtbuy_joint_test.json --resume saved/models/JointBERT-FT-abtbuy/0914_163847/model_best.pth

# ### cameras###
# python test_joint.py --device 0 -c configs/BERT/cameras/config_cameras_small_joint_test.json --resume saved/models/JointBERT-FT-cameras-small/0914_221214/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/cameras/config_cameras_medium_joint_test.json --resume saved/models/JointBERT-FT-cameras-medium/0914_222426/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/cameras/config_cameras_large_joint_test.json --resume saved/models/JointBERT-FT-cameras-large/0914_230458/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/cameras/config_cameras_xlarge_joint_test.json --resume saved/models/JointBERT-FT-cameras-xlarge/0915_024945/model_best.pth

# ### dblpscholar ##
# python test_joint.py --device 0 -c configs/BERT/dblpscholar/config_dblpscholar_joint_test.json --resume saved/models/JointBERT-FT-dblpscholar/0914_165333/model_best.pth

# ### monitor ###
# python test_joint.py --device 0 -c configs/BERT/monitor/config_monitor_joint_test.json --resume saved/models/JointBERT-FT-monitor/0914_171244/model_best.pth

# ### company ###
# python test_joint.py --device 0 -c configs/BERT/company/config_company_joint_test.json --resume saved/models/JointBERT-FT-company/0915_165348/model_best.pth

# python test_joint.py --device 0 -c configs/BERT/dblpscholar/config_dblpscholar_joint_test.json --resume saved/models/JointBERT-FT-dblpscholar/0915_165348/model_best.pth
