# EMBA

* **Building the conda environment**

    To build the exact conda environment used for the experiments, navigate to the project root folder where the file *EMBA.yml* is located and run ```conda env create -f EMBA.yml```
    
    Furthermore you need to install the project as a package. To do this, activate the jointbert environment with ```conda activate EMBA```, navigate to the root folder of the project, and run ```pip install -e .```


* **Running the BERT experiments**

    Navigate to *src/productbert/*
    This project is based on a <a target="_blank" href="https://github.com/wbsg-uni-mannheim/jointbert">JointBERT project</a> It is suggested to read the respective github readme to understand how to train models and possible input commands.
    * **Fine-Tuning**:
    The folder *src/productbert* contains bash scripts to run all of the experiments including the learning rate sweeps. Run any of the bash scripts titled *train_\*.sh* and append the id of the gpu you want to use, e.g. ```bash train_computers_bert.sh 0```

    * **Evaluating a trained model on a test set**:
    This is done by providing a config containing configuration parameters for the test run. Additionally you need to provide the checkpoint that should be used for testing. An example would be ```python test.py --device 0 -c configs/BERT/config_computers_small_test.json --resume saved/models/pathto/model/model_best.pth```
    
    The results of the BERT experiments can then be found in *src/productbert/saved/log* and the respective model checkpoints in *src/productbert/saved/models*.
    
    **NOTE**: When adjusting the batch size in any of the configs, make sure to also adjust the number of accumulation steps, as the combination of both constitutes the actual batch size.



Project based on the [cookiecutter data science project template](https://drivendata.github.io/cookiecutter-data-science/). #cookiecutterdatascience

PyTorch Project based on the [PyTorch template project](https://github.com/victoresque/pytorch-template/) by [Victor Huang](https://github.com/victoresque).
