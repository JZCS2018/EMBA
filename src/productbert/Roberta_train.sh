# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 5e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 8e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 3e-6


# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 8e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 3e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 4e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 5e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 6e-5

# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 7e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_xlarge.json --lr 7e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_large.json --lr 7e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_medium.json --lr 7e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_xlarge.json --lr 3e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_large.json --lr 3e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_medium.json --lr 3e-5

python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_xlarge.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_large.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_medium.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_xlarge.json --lr 3e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_large.json --lr 3e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_medium.json --lr 3e-5



# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 3e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --lr 1e-5




# python test_roberta.py --device 0 -m Roberta/ -c configs/Roberta/computers/config_computers_small.json --resume saved/Roberta/models/RoBERTa-FT-computers-small/1024_032602/model_best.pth