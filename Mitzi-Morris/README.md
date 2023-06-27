# Notebooks and data for StanCon 2023 Tutorial on BRMS

This tutorial works through the example dataset from the paper **_Visualization in Bayesian workflow_**:    

Gabry, J. , Simpson, D. , Vehtari, A. , Betancourt, M. and Gelman, A. (2019),     
Visualization in Bayesian workflow. _J. R. Stat. Soc. A_, 182: 389-402. doi:10.1111/rssa.12378

* Published JRSS version: https://rss.onlinelibrary.wiley.com/doi/full/10.1111/rssa.12378
* arXiv preprint: https://arxiv.org/pdf/1709.01449.pdf (includes Supplementary Materials in appendix)

### Exploratory Data Analysis 

Notebooks "eda\_air" are visualizations of the dataset in subdirectory `data`.

This dataset is GIS data, which requires either

* The R package `sf` - https://r-spatial.github.io/sf/index.html
* The Python package `GeoPandas` - https://geopandas.org/en/v0.4.0/index.html

### Fitting Models in BRMS

Notebooks "fit\_air\_brms" use BRMS to specify and fit the 3 models from the paper.
To run these notebooks you must install the R packages `BRMS` and `cmdstanr`.
The input data is in JSON format, and therefore doesn't require the `sf` library.



