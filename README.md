# Tutorial on biomedical machine learning

Biomedical machine learning tutorial using heart disease as an application

Author: Chris J. Kennedy

[RStudio Cloud link], [Slides link], [Binder link]

## Repository structure

 * 1-clean-merge.Rmd
 * 2-clean-impute.Rmd
 * 3-clean-finalize.Rmd
 * 4-eda.Rmd
 * 5-modeling.Rmd
 * 6-interpretation.Rmd
 * R/ - supplemental functions
 * data-raw/ - raw, read-only data
    * _startup.R - bootstraps the loading and potential installation of packages
 * data/ - processed data
 * tables/ - Latex-based results tables
 * visuals/ - plots, primarily as png or PDF
 
 Ideally use add bookdown, use slido, and integrate renv, and drake.

## Recommended reading

Boehmke, B., & Greenwell, B. M. (2019). Hands-On Machine Learning with R. CRC Press.

Molnar, C. (2020). Interpretable machine learning. Lulu.com.

Riley, R. D., van der Windt, D., Croft, P., & Moons, K. G. (Eds.). (2019). Prognosis Research in Healthcare: concepts, methods, and impact. Oxford University Press.

Steyerberg, E. W. (2019). Clinical prediction models. Springer International Publishing.