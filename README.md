# Tutorial on biomedical machine learning

Biomedical machine learning tutorial using heart disease as an application. If you use this tutorial in your work or research, please [cite the repository](#citation).

Author: Chris J. Kennedy ([ck37.com](https://ck37.com))

[RStudio Cloud link], [Slides link], [Binder link]

## Repository structure

 * **Analysis**
   * [1-clean-**merge**.Rmd](#tbd) - import and merge raw data, extreme values, constant predictors
   * [2-clean-**impute**.Rmd](#tbd) - analyze missingness, impute missing values, histogram condense
   * [3-clean-**finalize**.Rmd](#tbd) - factors to indicators, collinearity, check invertability
   * [4-**eda**.Rmd](#tbd) - exploratory data analysis
   * [5-**modeling**.Rmd](#tbd) - random forest convergence, SuperLearner ensembling, and nested SuperLearner evaluation
   * [6-**interpretation**.Rmd](#tbd) - variable importance and accumulated local effects
 * **Directories**
   * [R/](#tbd) - supplemental functions
     * [_startup.R](#tbd) - bootstraps the loading and potential installation of packages
   * [data-raw/](#tbd) - raw, read-only data
   * [data/](#tbd) - processed data
   * [tables/](#tbd) - results tables, primarily Latex or Excel
   * [visuals/](#tbd) - plots, primarily as png or PDF
 
Ideally use bookdown, integrate renv, use slido, and add drake.

## Recommended reading

### Source article

Kennedy, Chris J., Mark, Dustin, Huang, Jie, Reed, Mary. (2020). "Development of a nested ensemble machine learning prognostic model for predicting 60-day risk ofmajor adverse cardiac events in adults with chest pain."


### Source data

(Add heart disease citation.)

### Books

Boehmke, B., & Greenwell, B. M. (2019). **Hands-On Machine Learning with R**. CRC Press.

Molnar, C. (2020). **Interpretable machine learning**. Lulu.com.

Riley, R. D., van der Windt, D., Croft, P., & Moons, K. G. (Eds.). (2019). **Prognosis Research in Healthcare: concepts, methods, and impact**. Oxford University Press.

Steyerberg, E. W. (2019). **Clinical prediction models**. Springer International Publishing.

## Citation

If you find this tutorial useful please cite it as noted below:

Kennedy, Chris J. (2020). "Tutorial on biomedical machine learning." GitHub repository.
https://github.com/ck37/biomedical-machine-learning

