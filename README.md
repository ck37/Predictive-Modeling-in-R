# Tutorial on biomedical machine learning

Biomedical machine learning tutorial using heart disease as an application

Author: Chris J. Kennedy

[RStudio Cloud link], [Slides link], [Binder link]

## Repository structure

 * Analysis
   * 1-clean-**merge**.Rmd - import and merge raw data
   * 2-clean-**impute**.Rmd - analyze missingness, impute missing values, histogram condense
   * 3-clean-**finalize**.Rmd - factors to indicators, collinearity, check invertability
   * 4-**eda**.Rmd - exploratory data analysis
   * 5-**modeling**.Rmd - SuperLearner ensembling and nested SuperLearner evaluation
   * 6-**interpretation**.Rmd - variable importance and accumulated local effects
 * Directories
   * R/ - supplemental functions
     * _startup.R - bootstraps the loading and potential installation of packages
   * data-raw/ - raw, read-only data
   * data/ - processed data
   * tables/ - Latex-based results tables
   * visuals/ - plots, primarily as png or PDF
 
Ideally use bookdown, integrate renv, use slido, and add drake.

## Recommended reading

Boehmke, B., & Greenwell, B. M. (2019). Hands-On Machine Learning with R. CRC Press.

Molnar, C. (2020). Interpretable machine learning. Lulu.com.

Riley, R. D., van der Windt, D., Croft, P., & Moons, K. G. (Eds.). (2019). Prognosis Research in Healthcare: concepts, methods, and impact. Oxford University Press.

Steyerberg, E. W. (2019). Clinical prediction models. Springer International Publishing.