---
title: "`r knitr::current_input()`"
date: "`r paste('last updated', 
    format(lubridate::now(), ' %d %B %Y'))`"
output:   
  html_document:  
        code_folding: show
        toc: true 
        toc_depth: 4
        toc_float: true
        mathjax: default
  pdf_document:   
    latex_engine: lualatex
    toc: false
    toc_depth:  4   
    keep_tex:  true
  header-includes:  
    -  \usepackage{helvet}  
    -  \renewcommand{\familydefault}{\sfdefault}  
    -  \usepackage{ulem}
fontsize: 10pt   
geometry: margin=0.4in,top=0.25in   
TAGS:  definitions
---
***

\footnotesize{this is footnotesize}

```{r setup, include=FALSE		}
knitr::opts_chunk$set(echo = TRUE,
                      comment = "      ## ",
                      error = TRUE,
                      collapse = T   ) # T easier to read
```


```{r render, eval=FALSE, include=FALSE 	} 

{
output_dir  <- Sys.getenv("OUTPUT_DIR")
output_dir
file <- ""
file  <- normalizePath(c(".", file), mustWork=T)[[2]]
file
}
rmarkdown::render(file,
                  #output_format="html_document",
                  output_format="pdf_document",
                  output_dir=output_dir
                  )
```
