## \code{$new()} initialzes a new object of \code{lslx} R6 class for fitting semi-confirmatory structural equation modeling (SEM). ##
lslx$set("public",
         "initialize",
         function(model,
                  data,
                  ordered_variable,
                  weight_variable,
                  auxiliary_variable,
                  group_variable,
                  reference_group,
                  sample_cov,
                  sample_mean,
                  sample_size,
                  sample_moment_acov,
                  verbose = TRUE) {
           if (missing(model)) {
             stop("Argument 'model' cannot be empty.")
           }
           if (missing(data) & missing(sample_cov)) {
             stop("Argument 'data' and 'sample_cov' cannot be both empty.")
           } else {
             if (!missing(data)) {
               if (!is.data.frame(data)) {
                 data <- as.data.frame(data)
               }
               if (missing(ordered_variable)) {
                 ordered_variable <- NULL
               } else {
                 if (!(ordered_variable %in% colnames(data))) {
                   stop("Argument 'ordered_variable' is not recognized.")
                 }
               }
               if (missing(weight_variable)) {
                 weight_variable <- NULL
               } else {
                 if (length(weight_variable) > 1) {
                   stop("Argument `weight_variable` can be only of length one.")
                 }
                 if (!(weight_variable %in% colnames(data))) {
                   stop("Argument 'weight_variable' is not recognized.")
                 }
               }
               if (missing(auxiliary_variable)) {
                 auxiliary_variable <- NULL
               } else {
                 if (!all(auxiliary_variable %in% colnames(data))) {
                   stop("Argument 'auxiliary_variable' is not recognized.")
                 }
               }
               if (missing(group_variable)) {
                 group_variable <- NULL
                 name_group <- "g"
               } else {
                 if (length(group_variable) > 1) {
                   stop("Argument `group_variable` can be only of length one.")
                 }
                 if (!(group_variable %in% colnames(data))) {
                   stop("Argument 'group_variable' is not recognized.")
                 }
                 name_group <-
                   sort(levels(factor(getElement(
                     data, group_variable
                   ))))
               }
             } else if (!missing(sample_cov)) {
               if (!is.matrix(sample_cov) & !is.list(sample_cov)) {
                 stop(
                   "Argument 'sample_cov' must be a 'matrix' (for single group analysis)",
                   " or a 'list' of 'matrix' (for multiple group analysis)."
                 )
               }
               if (is.matrix(sample_cov)) {
                 sample_cov <- list(sample_cov)
               }
               if (is.null(names(sample_cov))) {
                 if (length(sample_cov) == 1L) {
                   name_group <- "g"
                 } else {
                   name_group <- paste0("g", 1:length(sample_cov))
                 }
                 names(sample_cov) <- name_group
               } else {
                 name_group <- names(sample_cov)
               }
               if (!missing(ordered_variable)) {
                 stop("Argument 'ordered_variable' is unnecessary under moment initialization.")
               }
               if (!missing(weight_variable)) {
                 stop("Argument 'weight_variable' is unnecessary under moment initialization.")
               }
               if (!missing(auxiliary_variable)) {
                 stop("Argument 'auxiliary_variable' is unnecessary under moment initialization.")
               }
               if (!missing(group_variable)) {
                 stop("Argument 'group_variable' is unnecessary under moment initialization.")
               }
               ordered_variable <- NULL
               weight_variable <- NULL
               auxiliary_variable <- NULL
               group_variable <- NULL
             } else {}
           }
           if (any(grepl(pattern = "/|\\||@",
                         x = name_group))) {
             stop(
               "Names of groups cannot contain '/', '|', and '@'.",
               "\n  Please change the names of groups in the specified data source."
             )
           }
           if (missing(reference_group)) {
             reference_group <- NULL
           } else if (is.na(reference_group)) {
    
           } else {
             if (length(name_group) == 1L) {
               stop("Argument 'reference_group' is unnecessary for single group analysis.")
             } else {
               if (!is.na(reference_group)) {
                 if (!(reference_group %in% name_group)) {
                   stop(
                     "Argument 'reference_group' is not recognized.",
                     "\n  Group names currently recognized by 'lslx' is ",
                     do.call(paste, as.list(name_group)),
                     " (possibly automatically created).",
                     "\n  Specified 'reference_group' is ",
                     reference_group,
                     "."
                   )
                 }
               }
             }
           }
           private$model <-
             lslxModel$new(model = model,
                           ordered_variable = ordered_variable,
                           weight_variable = weight_variable,
                           auxiliary_variable = auxiliary_variable,
                           group_variable = group_variable,
                           reference_group = reference_group,
                           name_group = name_group)
           private$data <- 
             lslxData$new(data = data,
                          sample_cov = sample_cov,
                          sample_mean = sample_mean,
                          sample_size = sample_size,
                          sample_moment_acov = sample_moment_acov,
                          group_variable = private$model$group_variable,
                          weight_variable = private$model$weight_variable,
                          auxiliary_variable = private$model$auxiliary_variable,
                          name_response = private$model$name_response,
                          name_group = private$model$name_group)
           private$fitting <- NULL
           if (verbose) {
             cat("An 'lslx' R6 class is initialized via",
                 ifelse(!missing(data), 
                        "'data'",
                        "'sample_cov'"),
                 "argument. \n")
             cat("  Response Variables:",
                 private$model$name_response,
                 "\n")
             if (length(private$model$name_factor) > 0) {
               cat("  Latent Factors:",
                   private$model$name_factor,
                   "\n") 
             }
             if (length(private$data$auxiliary) > 0) {
               cat("  Auxiliary Variables:",
                   colnames(private$data$auxiliary[[1]]),
                   "\n")               
             }
             if (length(private$model$name_group) > 1) {
               cat("  Groups:",
                   private$model$name_group,
                   "\n")
               if (!is.null(private$model$reference_group)) {
                 cat("  Reference Group:",
                     private$model$reference_group,
                     "\n")
               }
             }
             if (!is.null(private$model$reference_group)) {
               cat(
                 "NOTE:",
                 "Because",
                 private$model$reference_group,
                 "is set as reference,",
                 "coefficients in other groups actually represent increments from the reference.\n"
               )
             }
           }
         })
