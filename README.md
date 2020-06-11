# Short Course: Data Science in R 

Data science and machine learning tutorial using heart disease as an application.

**Author**: Chris Kennedy ([ck37.com](https://ck37.com))

[RStudio Cloud](https://rstudio.cloud/project/1374321),
[Google Slides ](https://docs.google.com/presentation/d/1jL7ukjJ95T-J0XbCOd2O-eMr4EGpqF5AzP2VxFoYRMA/edit#slide=id.p) 

## Repository structure

 * **Analysis**
   * [1-clean-**merge**.Rmd](https://github.com/ck37/Data-Science-R/blob/master/1-clean-merge.Rmd) - import and merge raw data, extreme values, constant predictors ([output](https://ck37.github.io/Data-Science-R/1-clean-merge.html))
   * [2-clean-**impute**.Rmd](https://github.com/ck37/Data-Science-R/blob/master/2-clean-impute.Rmd) - analyze missingness, impute missing values, histogram condense ([output](https://ck37.github.io/Data-Science-R/2-clean-impute.html))
   * [3-clean-**finalize**.Rmd](https://github.com/ck37/Data-Science-R/blob/master/3-clean-finalize.Rmd) - factors to indicators, collinearity, check invertability ([output](https://ck37.github.io/Data-Science-R/3-clean-finalize.html))
   * [4-**eda**.Rmd](https://github.com/ck37/Data-Science-R/blob/master/4-eda.Rmd) - exploratory data analysis
   * [5-**modeling**.Rmd](https://github.com/ck37/Data-Science-R/blob/master/5-modeling.Rmd) - random forest convergence, SuperLearner ensembling, and nested SuperLearner evaluation ([output](https://ck37.github.io/Data-Science-R/5-modeling.html))
   * [6-**calibration**.Rmd](https://github.com/ck37/Data-Science-R/blob/master/6-calibration.Rmd) - calibration of prediction
   * [7-**interpretation**.Rmd](https://github.com/ck37/Data-Science-R/blob/master/7-interpretation.Rmd) - variable importance and accumulated local effects ([output](https://ck37.github.io/Data-Science-R/7-interpretation.html))
 * **Directories**
   * [R/](https://github.com/ck37Data-Science-R/tree/master/R) - supplemental functions
     * [_startup.R](#tbd) - bootstraps the loading and potential installation of packages
   * [data-raw/](https://github.com/ck37/Data-Science-R/tree/master/data-raw) - raw, read-only data
   * [data/](https://github.com/ck37/learning/tree/master/data) - processed data
   * [tables/](https://github.com/ck37/Data-Science-R/tree/master/tables) - results tables, primarily Latex or Excel
   * [visuals/](https://github.com/ck37/Data-Science-R/tree/master/visuals) - plots, primarily as png or PDF
 
Ideally use bookdown, integrate renv, use slido, and add drake.

## Recommended reading

### Source article

Kennedy, Chris J., Mark, Dustin, Huang, Jie, Reed, Mary. (2020). "Development of a nested ensemble machine learning prognostic model for predicting 60-day risk of major adverse cardiac events in adults with chest pain."

### Source data

Janosi, A., Steinbrunn, W., Pfisterer, M., & Detrano, R. (1988). [Heart disease data set](https://archive.ics.uci.edu/ml/datasets/Heart+Disease). The UCI KDD Archive.

### Books

Boehmke, B., & Greenwell, B. M. (2019). **Hands-On Machine Learning with R**. CRC Press. ([Free online](https://bradleyboehmke.github.io/HOML/))

Molnar, C. (2020). **Interpretable machine learning**. Lulu.com. ([Free online](https://christophm.github.io/interpretable-ml-book/))

Riley, R. D., van der Windt, D., Croft, P., & Moons, K. G. (Eds.). (2019). **Prognosis Research in Healthcare: concepts, methods, and impact**. Oxford University Press.

Steyerberg, E. W. (2019). **Clinical prediction models**. Springer International Publishing.

## Citation

If you find this tutorial useful please cite it as noted below:

Kennedy, Chris J. (2020). "Tutorial on data science in R." GitHub repository.
https://github.com/ck37/Data-Science-R

