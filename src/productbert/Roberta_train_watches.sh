# python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 1e-4
# python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 8e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 3e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 1e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 8e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 5e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/watches/config_watches_small.json --lr 1e-6


# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 1e-4
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 8e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 3e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 1e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 8e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 5e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/abtbuy/config_abtbuy.json --lr 1e-6

# python train.py --device 0 -m Roberta/ -c configs/Roberta/dblpscholar/config_dblpscholar.json --lr 1e-4
# python train.py --device 0 -m Roberta/ -c configs/Roberta/dblpscholar/config_dblpscholar.json --lr 8e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/dblpscholar/config_dblpscholar.json --lr 3e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/dblpscholar/config_dblpscholar.json --lr 1e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/dblpscholar/config_dblpscholar.json --lr 8e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/dblpscholar/config_dblpscholar.json --lr 5e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/dblpscholar/config_dblpscholar.json --lr 1e-6


# python test_roberta.py --device 0 -c configs/Roberta/watches/config_watches_small_test.json --resume saved/Roberta/models/RoBERTa-FT-watches-small/1024_032131/model_best.pth

# python test_roberta.py --device 0 -c configs/Roberta/abtbuy/config_abtbuy_test.json --resume saved/Roberta/models/RoBERTa-FT-abtbuy/1024_032131/model_best.pth

# python train.py --device 0 -m Roberta/ -c configs/Roberta/company/config_company.json --lr 3e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/company/config_company.json --lr 1e-5
# python train.py --device 0 -m Roberta/ -c configs/Roberta/company/config_company.json --lr 8e-6
# python train.py --device 0 -m Roberta/ -c configs/Roberta/company/config_company.json --lr 5e-6

python train.py --device 0 -m Roberta/ -c configs/Roberta/cameras/config_cameras_small.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/cameras/config_cameras_xlarge.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/cameras/config_cameras_large.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/cameras/config_cameras_medium.json --lr 7e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/cameras/config_cameras_xlarge.json --lr 3e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/cameras/config_cameras_large.json --lr 3e-5
python train.py --device 0 -m Roberta/ -c configs/Roberta/cameras/config_cameras_medium.json --lr 3e-5
