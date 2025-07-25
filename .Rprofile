# ==============================
## ~/.Rprofile
##
##  USAGE:
##    To Start R without ~/.Rprofile
##    R --vanilla
##    ?startup
# ==============================
## 	PURPOSE: ~/.Rprofile file is runs for EVERY R process,
## 						regardless whether
## 						user or R initiated.
## 						Use if (interactive())
## 						for things ONLY user
## 						would want.  .Rprofile
## 						is akin .zshrc.

## ------------------------  NOTES
# .Options, names(.Options)  # same, as pairlist | 2nd is character vector
# ------------------------  options
#  options()                        # list currently set
#  options(x = "value")             #   set option x
# ------------------------  emacs
# EMACS
options(help_type="text")           #  EMACS - sends help to emacs, not browser?
# ------------------------  gander, LLM
# gander (R assistant in Rstudio)
#options(.gander_chat = ellmer::chat_ollama(model = "llama3.2"))
#options(.github_chat = ellmer::chat_githup(model = "gpt-4o")
# ----------------------------------------------------------------------
##  check if .Rprofile.site exists
site_path <- R.home(component = "home")
fname <- file.path(site_path, "etc", ".Rprofile.site")
if (file.exists(fname)) {
    print(".Rprofile.site exists!!")
}
rm(site_path)
rm(fname)
# ------------------------  CRAN mirror
if (F) {
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cloud.r-project.org"
    options(repos = r)
})
r
}
# ------------------------  use posit's package manager to install binary.

 options(HTTPUserAgent = sprintf(
   "R/%s R (%s)", 
   getRversion(), 
   paste(
     getRversion(), 
     R.version["platform"], 
     R.version["arch"], 
     R.version["os"]
   )
 ))
# ------------------------  example of change options
if (interactive()) {
    options(
        digits = 3,
        usethis.protocol = "ssh"
    )
}
# ------------------------ load popular, needed packages 
if (interactive()) {
    suppressMessages(library(devtools))
    suppressMessages(library(usethis))
    suppressMessages(library(rlang))
    suppressMessages(library(lobstr))
   #suppressMessages(library(sloop))
#   suppressMessages(library(xfun)) # utils from Yihui
    suppressMessages(library(rmarkdown))
    suppressMessages(library(tibble))
    suppressMessages(library(kableExtra))
    #suppressMessages(library(lookup)) # jim hester, returns source code
    ##  Fri 27Jan2023 (esp for JSON, unnesting)
    suppressMessages(library(tidyr))
    suppressMessages(library(jsonlite))
    suppressMessages(library(purrr))
    suppressMessages(library(dplyr))
}
