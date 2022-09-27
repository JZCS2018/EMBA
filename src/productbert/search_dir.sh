declare -a StringArray=("JointBERT-FT-shoes-small" "JointBERT-FT-shoes-medium" "JointBERT-FT-shoes-large" 
"JointBERT-FT-shoes-xlarge" "JointBERT-FT-watches-small" "JointBERT-FT-watches-medium" "JointBERT-FT-watches-large" 
"JointBERT-FT-watches-xlarge")

commd="python test_joint.py --sdirname test/ --device 0 -c configs/BERT"



for dire in "${StringArray[@]}"

do 
search_dir="saved/models/$(basename "$dire")"

if [[ $search_dir == *"shoes"* ]]; then

for entry in "${search_dir}"/*
do
if [[ $entry == *"small"* ]]; then
  $commd/shoes/config_shoes_small_joint_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"medium"* ]]; then
  $commd/shoes/config_shoes_medium_joint_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"large"* ]]; then
  $commd/shoes/config_shoes_large_joint_test.json --resume $entry/model_best.pth
fi
if [[ $entry == *"xlarge"* ]]; then
  $commd/shoes/config_shoes_xlarge_joint_test.json --resume $entry/model_best.pth
fi
done
fi

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

done
