#' Return the number of CPU cores to use in analysis.
#' 
#' Specify the percentage of available cores to use, from 0 to 1.
#' I.e. 0.5 = 50%
#' 
#' By default it uses 50%, but this default can be changed by modifying
#' attr(get_cores, "default_pct")
get_cores = function(pct = attr(get_cores, "default_pct")) {
  cores = RhpcBLASctl::get_num_cores()
  # Check if max_cores is set in the conf list()
  cores_used = ifelse(exists("conf") && "max_cores" %in% names(conf),
                   conf$max_cores, floor(cores * pct))
  getOption("cores", cores_used)
}
# Use 50% of available cores by default.
attr(get_cores, "default_pct") = 0.5