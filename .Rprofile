## see help(Startup) for documentation on ~/.Rprofile and Rprofile.site
# ==============================
## ~/.Rprofile
##
## To Start R with ~/.Rprofile
## R --vanilla
## ?startup
# ==============================
##	PURPOSE:	~/.Rprofile is runs for EVERY R process, regardless whether 
##						user or R initiated.   Use if (interactive()) for things ONLY
##						user would want.


# ==============================
# ## Example of .Rprofile
# ==============================
# options(width=65, digits=5)
# options(show.signif.stars=FALSE)
# setHook(packageEvent("grDevices", "onLoad"),
#         function(...) grDevices::ps.options(horizontal=FALSE))
# set.seed(1234)
# .First <- function() cat("\n   Welcome to R!\n\n")
# .Last <- function()  cat("\n   Goodbye!\n\n")

# ## Example of Rprofile.site
# local({
#  # add MASS to the default packages, set a CRAN mirror
#  old <- getOption("defaultPackages"); r <- getOption("repos")
#  r["CRAN"] <- "http://my.local.cran"
#  options(defaultPackages = c(old, "MASS"), repos = r)
#})
# ==============================
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

## ============
		## Jim:	 set
## ============


if (interactive()) {
## set 4 AUG 2021
jim_lib  <- '/home/jim/R/x86-64-linux-gnu-library/4.1'

options(
	 digits=3,
	 usethis.protocol = "ssh",
	 lib=jim_lib)

# options(
# 	 # display traceback on error, in simplifid or branch form.
# 
#   # rlang_backtrace_on_error = "branch",
# 
# 	 # turn base R errors into R lang errors
#   #  error = rlang::entrace
# 
# 
# 	 #  QUESTION:    error=recover() # allows examination of stack?
# 
# 	 # help_type = 'html',
# 	 # width = 200,
# 	 # browser = 'kfmclient newTab', 
# 	 # repos = "http://debian.mc.vanderbilt.edu/R/CRAN/", 
# 	 # warnPartialMatchDollar = TRUE,
# 	 # warnPartialMatchArgs = TRUE,
# 	 # show.error.locations = "top",      # this gives the location of the error. Source location highest on the stack (inside)
# 	 # xdvicmd = 'okular'
# 	 #
# )


message("..... reading ~/.Rprofile  .....")

}
## =====================
##		Devtools, usethis, rlang, lobstr etc ....
## =====================
## autoloads (i.e no need library(devtools))
## 11MAY 2022; jr removed some packages; if need just uncomment	  
if (interactive()) {
	#suppressMessages(library(reprex))
  suppressMessages(library(devtools))
	suppressMessages(library(usethis))
  suppressMessages(library(rlang))
	suppressMessages(library(lobstr))
	#suppressMessages(library(here))
	suppressMessages(library(sloop))
  suppressMessages(library(xfun)) # utils from Yihui
	suppressMessages(library(rmarkdown))
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
