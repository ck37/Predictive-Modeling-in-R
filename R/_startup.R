#' Load all packages needed, installing any missing packages if desired.
#' @param packages_cran Character vector of CRAN packages to load, and possibly install if needed.
#' @param packages_github Character vector of github packages to load, and possibly install if needed.
#' @param auto_install Install any packages that could not be loaded.
#' @param update Update any packages that can be updated.
#' @param java_mem Amount of RAM to allocate to rJava, e.g. "2gb". This must happen before
#'   the rJava library is loaded. If it happens afterwards it will not change available memory.
#' @param skip_ssl If TRUE, skip SSL verification during package installation. 
#' @param verbose If TRUE display extra output during execution.
load_all_packages =
  function(packages_cran = NULL,
           packages_github = NULL,
           auto_install = FALSE,
           update = FALSE,
           java_mem = NULL,
           skip_ssl = FALSE,
           verbose = FALSE) {
    
    # Necessary to install github packages in certain IT settings.
    if (skip_ssl) {
      httr::set_config(httr::config(ssl_verifypeer = 0L))
    }
    
    if (verbose) {
      # Output R version so we know which package versions we're using.
      cat(R.version.string, "\n")
    }
    
    if (verbose) {
      cat("CRAN packages:", paste(packages_cran, collapse = ", "), "\n")
      cat("Github packages:", paste(packages_github, collapse = ", "), "\n")
    }
    
    # Allocate memory to Java for bartMachine; needs to happen before we load rJava library.
    # TODO: may want to defer this step (and loading rJava) until we have setup parallelization.
    if (!is.null(java_mem)) {
      options(java.parameters = paste0("-Xmx", java_mem))
    }
    
    # Code is not yet run. We run afterward, possibly with messages suppressed.
    expression = quote({
      
      # Install remotes if we don't already have it.
      if (!require("remotes") && auto_install) {
        if (verbose) cat("No remotes detected - installing.\n")
        install.packages("remotes")
        library(remotes)
      }
      
      # Install any packages from github that are needed.
      if (length(packages_github) > 0) {
        if (auto_install) {
          remotes::install_github(packages_github)
        }
        
        if (is.null(names(packages_github))) {
          # Extract package name as the repo name of each package, if the vector itself is not named.
          # This assumes github packages are of the form: username/repo@whatev (@whatev optionally included).
          github_names = gsub("^[^/]+/([^@]+).*$", "\\1", packages_github)
        } else {
          # Support a named vector, in case the package name is not the same as the repo name.
          github_names = names(packages_github)
        }
        invisible(sapply(github_names, require, character.only = T))
      }
      
      # This part clearly requires that the ck37r package was already installed,
      # either via packages_cran or packages_github.
      ck37r::load_packages(packages_cran, auto_install, update, verbose = verbose)
    })
    
    # Now run the stored code either directly or with messages suppressed.
    if (verbose) {
      # Allow messages to be output.
      eval(expression)
    } else {
      # Suppress messages.
      suppressMessages(eval(expression))
    }
  }


#' @param packages_cran Character vector of CRAN packages to load, and possibly install if needed.
#' @param packages_github Character vector of github packages to load, and possibly install if needed.
#' @param ... Passed through to load_all_packages()
startup = function(packages_cran = NULL,
                   packages_github = NULL,
                   ...) {
  if (is.null(packages_cran)) {
    # Extract defaults based on an attribute so that it can be examined/modified if needed.
    packages_cran = attr(startup, "packages_cran")
  }
  
  if (is.null(packages_github)) {
    # Extract defaults based on an attribute so that it can be examined/modified if needed.
    packages_github = attr(startup, "packages_github")
  }
  
  load_all_packages(packages_cran = packages_cran,
                    packages_github = packages_github, ...)
}

# Specify defaults as attributes so that they can be extracted programmatically.
attr(startup, "packages_cran") = c(
  
  ###################
  # Utilities
  "here",        # Detecting the main directory for a project.
  "magrittr",    # For %$%
  "renv",        # Reproducible package versions
  "remotes",     # Package installation from GitHub
  
  ###################
  # Data cleaning and management
  "caret",       # Identify collinear predictors
  "dplyr",
  # Conflicts with dplyr for some functions, so don't load automatically.
  #"data.table",
  "histogram",
  "rio",
  
  ###################
  # Output / reporting
  "kableExtra",  # Table formatting for latex & HTML
  "knitr",       # PDF and HTML reports
  "rmarkdown",   # Markdown-formatted R code
  
  ###################
  # Parallelization
  "future",      # Parallelization framework
  "RhpcBLASctl", # Determine number of cores vs. threads on a computer.
  
  ###################
  # Visualization
  "ggplot2",     # Plotting framework
  "superheat",   # Heatmaps
  "gginnards",   # used in variable-importance.Rmd?
  "iml",         # Interpretable machine learning
  "rpart.plot",  # Decision tree plots
  "scales",      # Improve labeling of ggplot axes
  
  ###################
  # Machine learning
  "glmnet",      # Lasso / elastic net
  "h2o",         # GLRM imputation
  "OOBCurve",    # RF performance plateau analysis.
  "mgcv",        # Splines
  "mlr",         # Machine learnning framework. TODO: Update to mlr3
  "precrec",     # PR-AUC analysis
  "ranger",      # Random Forest
  "rpart",       # Decision trees
  "xgboost",     # Extreme gradient boosting
  NULL
)

attr(startup, "packages_github") = c(
  "ecpolley/SuperLearner", # Ensemble learning
  "ck37/ck37r", # Misc methods
  "vdorie/dbarts", # Bayesian additive regression trees
  NULL
)
