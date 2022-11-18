#!/bin/bash
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/computers/config_computers_small_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-computers-small/1028_010427/model_best.pth
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/computers/config_computers_medium_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-computers-medium/1027_234126/model_best.pth
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/computers/config_computers_large_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-computers-large/1027_200133/model_best.pth
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/computers/config_computers_xlarge_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-computers-xlarge/1027_112756/model_best.pth

# python test_joint.py --device 0 -c configs/jointbert/computers/config_computers_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-computers-small/0922_211400/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/computers/config_computers_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-computers-small/0922_212914/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/computers/config_computers_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-computers-small/0922_214534/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/computers/config_computers_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-computers-small/0922_221719/model_best.pth

# ### cameras###
# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-small/0922_223528/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-small/0922_225006/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-small/0922_230035/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-small/0922_231230/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-small/0922_232531/model_best.pth

# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_medium_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-medium/0922_233440/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_medium_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-medium/0923_004410/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_medium_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-medium/0923_015222/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_medium_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-medium/0923_030314/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/cameras/config_cameras_medium_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-cameras-medium/0923_035440/model_best.pth

# ## Watch ##
# python test_joint.py --device 0 -c configs/jointbert/watches/config_watches_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-watches-small/0923_042647/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/watches/config_watches_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-watches-small/0923_044917/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/watches/config_watches_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-watches-small/0923_050133/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/watches/config_watches_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-watches-small/0923_051536/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/watches/config_watches_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-watches-small/0923_053450/model_best.pth

## Shoes##
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/shoes/config_shoes_small_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-shoes-small/1026_215349/model_best.pth
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/shoes/config_shoes_medium_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-shoes-medium/1026_213038/model_best.pth
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/shoes/config_shoes_large_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-shoes-large/1026_210041/model_best.pth
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/shoes/config_shoes_xlarge_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-shoes-xlarge/1026_201622/model_best.pth

# python test_joint.py --device 0 -c configs/jointbert/shoes/config_shoes_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-shoes-small/0923_063659/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/shoes/config_shoes_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-shoes-small/0923_064753/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/shoes/config_shoes_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-shoes-small/0923_070250/model_best.pth
# python test_joint.py --device 0 -c configs/jointbert/shoes/config_shoes_small_joint_test.json --resume saved/joint_bert/models/JointBERT-FT-shoes-small/0923_072836/model_best.pth



# #### Watch####
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/watches/config_watches_small_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-watches-small/1027_105519/model_best.pth
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/watches/config_watches_medium_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-watches-medium/1027_093951/model_best.pth
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/watches/config_watches_large_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-watches-large/1027_054812/model_best.pth
python test_joint.py --device 0 -m ABLavg/ -c configs/jointbert/watches/config_watches_xlarge_joint_test.json --resume saved/ABLavg/models/JointBERT-FT-watches-xlarge/1026_220734/model_best.pth

### Shoes####
# python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_small_joint_test.json --resume saved/models/JointBERT-FT-shoes-small/0914_170532/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_medium_joint_test.json --resume saved/models/JointBERT-FT-shoes-medium/0914_171913/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_large_joint_test.json --resume saved/models/JointBERT-FT-shoes-large/0914_180509/model_best.pth
# python test_joint.py --device 0 -c configs/BERT/shoes/config_shoes_xlarge_joint_test.json --resume saved/models/JointBERT-FT-shoes-xlarge/0914_221345/model_best.pth

# ### abtbuy###
# python test_joint.py --device 0 -c configs/BERT/abtbuy/config_abtbuy_joint_test.json --resume saved/models/JointBERT-FT-abtbuy/0914_163847/model_best.pth




# ### dblpscholar ##
# python test_joint.py --device 0 -c configs/BERT/dblpscholar/config_dblpscholar_joint_test.json --resume saved/models/JointBERT-FT-dblpscholar/0914_165333/model_best.pth

# ### monitor ###
# python test_joint.py --device 0 -c configs/BERT/monitor/config_monitor_joint_test.json --resume saved/models/JointBERT-FT-monitor/0914_171244/model_best.pth

# ### company ###
# python test_joint.py --device 0 -c configs/BERT/company/config_company_joint_test.json --resume saved/models/JointBERT-FT-company/0915_165348/model_best.pth