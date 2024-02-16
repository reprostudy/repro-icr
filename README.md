# Reproducibility Study of [Improvement-Focused Causal Recourse (ICR)](https://arxiv.org/abs/2210.15709)
## Experiments
---

This repository contains the code to reproduce the experiments of the paper [Improvement-Focused Causal Recourse (ICR)](https://arxiv.org/abs/2210.15709). The code is a fork of the official [ICR repository](https://github.com/gcskoenig/icr).


### Installation

We used python version `3.11.4`. We recommend to set up a fresh virtual environment, to install the dependenciees and then the package. We recommend to use [pyenv](https://github.com/pyenv/pyenv) to manage your python versions and [poetry](https://python-poetry.org/) to manage your virtual environments.

1. Install python version `3.11.4` using pyenv: `pyenv install 3.11.4`
2. Create a virtual environment using poetry: `poetry init` and then `poetry install`

Before contributing, please install the pre-commit hooks using `poetry run pre-commit install`.


#### Alternative Installation
Alternatively, you can use conda to setup the environment. We recommend to use [miniconda](https://docs.conda.io/en/latest/miniconda.html) to manage your python versions and [poetry](https://python-poetry.org/) to manage your virtual environments.

1. Create conda environment: `conda env create -f environment.yml`
2. Activate conda environment: `conda activate fact-icr`

### Project Structure
This repository is structured as follows:
* `experiments/`: contains the scripts to run the experiments
* `results/`: contains the results of the experiments
  * `output-author-run`: results of the experiments as run by the authors ([source](https://github.com/gcskoenig/icr/blob/main/results.zip)).
  * `output-initial-run`: results of the experiments run for three iterations. Used to validate the code.
  * `output-full-exp`: results of the experiments run for 10 iterations. Used to produce the plots in the paper.
  * `output-additional-exp`: results of an additional experiment run for 10 iterations. Used to produce the plots in the paper.
* `scripts/`: contains scripts to run experiments and produce plots
* `src/`: contains the source code of the package

### How to Reproduce Results

In order to reproduce our results found within `experiments` directory, run the following scripts:
> Note: the experiments can take a long time to run. We recommend to run them on a cluster. We use parallel execution of the experiments using [GNU parallel](https://www.gnu.org/software/parallel/). Configure the number of cores within script file to match your system.

**IMPORTANT**: Before running the experiments, please make sure that you have activated the virtual environment using `poetry shell` or `conda activate fact-icr`.

```bash
sh ./experiments/run-initial-run.sh # this will run the experiments for three iterations
sh ./experiments/run-full-exp.sh # this will run the experiments for 10 iterations
sh ./experiments/run-additional-exp.sh # this will run the additional experiments for 10 iterations
```

---
In the `[savepath]` folder, for each scm you can then find two files called

- `resultss.csv`: summary statistics for all experiment folders in the specified result folder. mean and standard deviation for
  - `eta_mean`: specified desired acceptance rate
  - `gamma_mean`: specified desired improvement rate
  - `perc_recomm_found`: percent of recourse-seeking individuals for which a recommendation could be made
  - `eta_obs_mean`: average acceptance rate (observed)
  - `gamma_obs_mean`: average improvement rate (observed)
  - `eta_obs_individualized_mean`: average acceptance rate for the individualized post-recourse predictor (observed)
  - `eta_obs_refits_batch0_mean_mean`: average acceptance rate mean over all (model multiplicity) refits on batch 1 evaluated over batch 2.
  - `intv-cost_mean`: averge cost of the suggested interventions
  - `[...]_std`: the respective standard deviations
- `invs_resultss.csv`: overview of interventions performed for each of the variables as well as aggregated for causes and non-causal variables

### How to Produce Plots
The experiments can be compiled and combined into a plot using

```
python scripts/plots.py --savepath [savepath]
```
