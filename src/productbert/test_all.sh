declare -a StringArray=("JointBERT-FT-amazongoogle" "JointBERT-FT-beer" "JointBERT-FT-fodorszagat" 
 "JointBERT-FT-walmartamazon")

commd="python test_joint.py --sdirname AOA/ --device 0 -c configs/jointbert"




for dire in "${StringArray[@]}"

do 
search_dir="saved/joint_bert/AOA/models/$(basename "$dire")"

if [[ $search_dir == *"amazongoogle"* ]]; then

for entry in "${search_dir}"/*
do
  $commd/amazongoogle/config_amazongoogle_joint_test.json --resume $entry/model_best.pth

done
fi

if [[ $search_dir == *"beer"* ]]; then

for entry in "${search_dir}"/*
do
  $commd/beer/config_beer_joint_test.json --resume $entry/model_best.pth

done
fi

if [[ $search_dir == *"fodorszagat"* ]]; then

for entry in "${search_dir}"/*
do
  $commd/fodorszagat/config_fodorszagat_joint_test.json --resume $entry/model_best.pth

done
fi

if [[ $search_dir == *"walmartamazon"* ]]; then

for entry in "${search_dir}"/*
do
  $commd/walmartamazon/config_walmartamazon_joint_test.json --resume $entry/model_best.pth

done
fi
done
