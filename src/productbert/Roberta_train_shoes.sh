# python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_small.json --lr 1e-4
# python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_small.json --lr 8e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_small.json --lr 3e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_small.json --lr 1e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_small.json --lr 5e-4
# python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_small.json --lr 8e-4


# python test_roberta.py --device 0 -c configs/Roberta/shoes/config_shoes_small_test.json --resume saved/Roberta/models/RoBERTa-FT-shoes-small/1024_032131/model_best.pth

# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 1e-4
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 8e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 3e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 1e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 8e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 5e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 1e-6

python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_small.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_xlarge.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_large.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_medium.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_xlarge.json --lr 3e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_large.json --lr 3e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/shoes/config_shoes_medium.json --lr 3e-5

python test_roberta.py --device 0 -c configs/Roberta/shoes/config_shoes_small_test.json --resume saved/Roberta/models/RoBERTa-FT-shoes-small/1024_032131/model_best.pth