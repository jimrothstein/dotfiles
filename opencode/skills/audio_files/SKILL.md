---
name: audio_files 
description: Use this skill whenever the user says to "modify audio_files.R"
version: .001
---


## Directories
- R code:   ~/code/jimTools/R/310_audio_files.R
- output directory ~/code/jimTools/R/



## Read R file
- 310_audio_files.R

## Modify the R code: Step1
- read the dataset, readRDS("~/code/jimTools/R/audio_files.RDS")
- If column "Step1" already exists, go to "Modify the R code: Step2" and ignore the remaining lines in this section. 
- Otherwise 
- add a new column, call it "Step1"
- copy the contents of "original" to "Step1"
- save this tibble using writeRDS, this will overwrite the existing RDS file.  
- save the R code in "R/311_step1.R"


## Modify the R code: Step2
- read the dataset, readRDS("~/code/jimTools/R/audio_files.RDS")
- add a new column, call it "Step2"

- remove the prefix of file name, as follows 

0000_XXX  becomes XXX  (X is any alpha numeric character)
000_XXX becomee XXX

- save this tibble using writeRDS, this will overwrite the existing RDS file.  

## Modify the R code: Step3
- This is placeholder
- Continue.

### Update version
- Read metadata yaml header of this file.
- Find "version:" in metadata, replace its value with .001 plus the original value. (example:  "version: .001" becomes "verson: .002", and  "version: 0.512 becomes "version: .513")
- Do not change the name or description in the yaml header.

### Save R file
- now save the modified R file with same name "310_audio_files.R" (this will overwrite the exising R file)

