# ==============================
## ~/.Rprofile
##
## To Start R with ~/.Rprofile
## R --vanilla
## ?startup
# ==============================
##	PURPOSE:	~/.Rprofile is runs for EVERY R process, regardless whether 
##						user or R initiated.   Use if (interactive()) for things ONLY
##						user would want.  .Rprofile is akin .zshrc.


# 
#  options() # list currently set
# .Options, names(.Options)  # same, as pairlist | 2nd is character vector
##
#	----------------------------------------------------------------------
	.First <- function() cat("\n  -----------------------------------------  \n\n")
	# .Last <- function()  cat("\n   Goodbye!\n\n")
	# message("..... ~/.Rprofile message ..")
#----------------------------------------------------------------------
#
#
# ==============================
	## Set cloud mirror, which is 'network-close' to everybody, as default
# ==============================
local({
    r <- getOption("repos")
    r["CRAN"] <- "https://cloud.r-project.org"
    options(repos = r)
})


if (interactive()) {
## set Sun 08Jan2023

options(
	 digits=3,
	 usethis.protocol = "ssh"
	 )


}
## =====================
##		Devtools, usethis, rlang, lobstr etc ....
## =====================
## 11MAY 2022; jr removed some packages; if need just uncomment	  
if (interactive()) {
  suppressMessages(library(devtools))
	suppressMessages(library(usethis))
  suppressMessages(library(rlang))
	suppressMessages(library(lobstr))
	suppressMessages(library(sloop))
  suppressMessages(library(xfun)) # utils from Yihui
	suppressMessages(library(rmarkdown))
	suppressMessages(library(tibble))
	suppressMessages(library(kableExtra))


##  Fri 27Jan2023 (esp for JSON, unnesting)
	suppressMessages(library(tidyr))
	suppressMessages(library(jsonlite))
	suppressMessages(library(purrr))
	suppressMessages(library(dplyr))




}

##	--------------------------------------------------------------------
##			REditor/languageserver
##	--------------------------------------------------------------------
##  set 27 SEP 2021
##  options in ~/.Rprofile will overwrite configuration in LSPConfig
#	--------------------------------------------------------------------
##
##  turn off lintr - driving me nuts
options(languageserver.diagnostics = FALSE)

