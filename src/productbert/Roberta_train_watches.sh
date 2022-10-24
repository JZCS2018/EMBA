python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 1e-4
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 8e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 3e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 1e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 8e-6
python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 5e-6

python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 1e-6


# python test_roberta.py --device 0 -c configs/Roberta/watches/config_watches_small_test.json --resume saved/Roberta/models/RoBERTa-FT-watches-small/1024_032131/model_best.pth