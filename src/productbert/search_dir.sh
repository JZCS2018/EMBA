
# declare -a StringArray=("JointBERT-FT-cameras-small" "JointBERT-FT-cameras-medium" "JointBERT-FT-cameras-large" "JointBERT-FT-cameras-xlarge" )
declare -a StringArray=("RoBERTa-FT-cameras-small" "RoBERTa-FT-cameras-medium" "RoBERTa-FT-cameras-large" "RoBERTa-FT-cameras-xlarge" )

# declare -a StringArray=("JointBERT-FT-cameras-small" "JointBERT-FT-cameras-medium" "JointBERT-FT-cameras-large" 
#  "JointBERT-FT-computers-small" "JointBERT-FT-computers-medium" "JointBERT-FT-computers-large" 
# )

# declare -a StringArray=(
# "RoBERTa-FT-watches-small" "RoBERTa-FT-watches-medium" "RoBERTa-FT-watches-large" 
# "RoBERTa-FT-watches-xlarge")

# declare -a StringArray=("JointBERT-FT-cameras-small" "JointBERT-FT-shoes-medium" "JointBERT-FT-shoes-large" 
# "JointBERT-FT-shoes-xlarge" )
# # "JointBERT-FT-watches-small" "JointBERT-FT-watches-medium" "JointBERT-FT-watches-large" 
# # "JointBERT-FT-watches-xlarge")

commd="python test_roberta.py --sdirname abl/ --device 0 -c configs/Roberta"
# commd="python test_joint.py --sdirname Roberta/ --device 0 -c configs/jointbert"
commd="python test_roberta.py --sdirname Roberta/ --device 0 -c configs/Roberta"



for dire in "${StringArray[@]}"

do 
search_dir="saved/ABLavg/models/$(basename "$dire")"

if [[ $search_dir == *"watches"* ]]; then

for entry in "${search_dir}"/*
do
if [[ $entry == *"small"* ]]; then
  $commd/watches/config_watches_small_joint_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"medium"* ]]; then
  $commd/watches/config_watches_medium_joint_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"large"* ]]; then
  $commd/watches/config_watches_large_joint_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"xlarge"* ]]; then
  $commd/watches/config_watches_xlarge_joint_test.json --resume $entry/model_best.pth
fi
done
fi

if [[ $search_dir == *"watches"* ]]; then

for entry in "${search_dir}"/*
do
if [[ $entry == *"small"* ]]; then
  $commd/cameras/config_cameras_small_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"medium"* ]]; then
  $commd/cameras/config_cameras_medium_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"large"* ]]; then
  $commd/cameras/config_cameras_large_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"xlarge"* ]]; then
  $commd/cameras/config_cameras_xlarge_test.json --resume $entry/model_best.pth
fi
done
fi

# for entry in "${search_dir}"/*
# do
# if [[ $entry == *"small"* ]]; then
#   $commd/cameras/config_cameras_small_joint_test.json --resume $entry/model_best.pth
# fi
# if [[ $entry == *"medium"* ]]; then
#   $commd/cameras/config_cameras_medium_joint_test.json --resume $entry/model_best.pth
# fi
# if [[ $entry == *"large"* ]]; then
#   $commd/cameras/config_cameras_large_joint_test.json --resume $entry/model_best.pth
# fi
# if [[ $entry == *"xlarge"* ]]; then
#   $commd/cameras/config_cameras_xlarge_joint_test.json --resume $entry/model_best.pth
# fi
# done
# fi

# if [[ $search_dir == *"computers"* ]]; then

=======
  $commd/watches/config_watches_small_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"medium"* ]]; then
  $commd/watches/config_watches_medium_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"large"* ]]; then
  $commd/watches/config_watches_large_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"xlarge"* ]]; then
  $commd/watches/config_watches_xlarge_test.json --resume $entry/model_best.pth
fi
done
fi

# do 
# search_dir="saved/Roberta/models/$(basename "$dire")"

# if [[ $search_dir == *"watches"* ]]; then

# for entry in "${search_dir}"/*
# do
# if [[ $entry == *"small"* ]]; then
#   $commd/cameras/config_cameras_small_joint_test.json --resume $entry/model_best.pth
# fi
# if [[ $entry == *"medium"* ]]; then
#   $commd/cameras/config_cameras_medium_joint_test.json --resume $entry/model_best.pth
# fi
# if [[ $entry == *"large"* ]]; then
#   $commd/cameras/config_cameras_large_joint_test.json --resume $entry/model_best.pth
# fi
# if [[ $entry == *"xlarge"* ]]; then
#   $commd/cameras/config_cameras_xlarge_joint_test.json --resume $entry/model_best.pth
# fi
# done
# fi

# if [[ $search_dir == *"computers"* ]]; then


# for entry in "${search_dir}"/*
# do
# if [[ $entry == *"small"* ]]; then
#   $commd/computers/config_computers_small_joint_test.json --resume $entry/model_best.pth
# fi
# if [[ $entry == *"medium"* ]]; then
#   $commd/computers/config_computers_medium_joint_test.json --resume $entry/model_best.pth
# fi
# if [[ $entry == *"large"* ]]; then
#   $commd/computers/config_computers_large_joint_test.json --resume $entry/model_best.pth
# fi
# # if [[ $entry == *"xlarge"* ]]; then
# #   $commd/computers/config_computers_xlarge_joint_test.json --resume $entry/model_best.pth
# # fi
# done
# fi

done
