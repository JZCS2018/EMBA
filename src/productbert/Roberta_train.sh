python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 5e-6
python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 8e-6
python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 1e-6


python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 8e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 3e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 1e-5




# python test_roberta.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --resume saved/Roberta/models/RoBERTa-FT-computers-small/1024_032602/model_best.pth