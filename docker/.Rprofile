if (interactive()) {

  grDevices::X11.options(width = 16, height = 16, pointsize = 24)

  library(colorout)
  setOutputColors(normal = NA, negnum = 2, zero = 3, number = 3, date = 2,
    string = 6, const = 1, false = c(1, NA, 2), true = c(1, NA, 1), infinite = 5,
    stderror = 4, warn = c(1, NA, 1), error = c(1, NA, 1), verbose = FALSE,
    zero.limit = NA)

  setHook(packageEvent("grDevices", "onLoad"),
          function(...) grDevices::X11.options(width = 16, height = 16,
                                               pointsize = 24))

  q <- function (save = "no", ...) {
    quit(save = save, ...)
  }

  if (!nzchar(Sys.getenv("RSTUDIO_USER_IDENTITY"))) {
    options(width = system("tput cols", intern = TRUE))
  }

  # openblas.set.num.threads <- inline::cfunction(signature(ipt = "integer"),
  #   body = "openblas_set_num_threads(*ipt);",
  #   otherdefs = c ("extern void openblas_set_num_threads(int);"),
  #   libargs = c ("-L/opt/openblas/lib -lopenblas"),
  #   language = "C",
  #   convention = ".C"
  #   )

  # openblas.set.num.threads(4)

  # rstan::rstan_options(auto_write = TRUE)
  # options(mc.cores = 4)
  # options(languageserver.default_linters = lintr::with_defaults(
  #     line_length_linter = lintr::line_length_linter(100),
  #     object_length_linter = NULL,
  #     object_name_linter = NULL,
  #     commented_code_linter = NULL
  # ))
  #
}

# if(interactive()){
#        # Suggested libraries:
#        library(colorout)
#
#        # Use text based web browser to navigate through R docs after help.start()
#        # if you cannot run a graphical web browser (e.g. when you are in the
#        # Linux console):
#         if(Sys.getenv("DISPLAY") == ""){
#             if(Sys.getenv("TMUX") != "")
#                 options(browser = function(u) system(paste0("tmux new-window 'w3m ", u, "'")))
#             else if(Sys.getenv("NVIMR_TMPDIR") != "")
#                 options(browser = function(u) .C("nvimcom_msg_to_nvim",
#                                                  paste0('StartTxtBrowser("w3m", "', u, '")')))
#         }
# }
