# Installation 

First, set up a virtial environment using Python 3.10 (don't necessarily need Python 3.10, but that is the version I used): 

```
python3.10 -m venv stancon-2023
```

After activating the virtual environment: 

```
source stancon-2023/bin/activate
```

you can install all necessary requirements with: 

```
pip install -r requirements/requirements.txt 
```

The last step is to install the iPython kernel: 

```
python -m ipykernel install --name stancon-2023
```

And you should be good to go! 

# Navigation 

This repo is set up such that workflow materials are all in the `notebooks/workflow` folder. After setting up the environment as described above, you should be able to run through the "loss_development" and "forecasting" notebooks in sequence. Feel free to follow along! 
