---
name: typst
description: Use this skill whenever the user says to use "typst" or says "*.typ".
---

## typst


### Be terse.   Before making any changes to file, present a plan to user.  Do not guess, ask the user questions.


### The user prefers to insert typst code into quarto *.qmd file

## Quarto  (insert typst in code chunk below)
```{=typst}

```

## Default is quarto (*.qmd)
- Default: embed typst inside quarto file.  
- EXCEPT when user specifies save as typst (*.typ*)
- If user specifies typst, always confirm this.


### Default directories for *.qmd files with or without embedded typst code are:
- ~/code/docs/tech_notes/
- ~/code/publish_project/typst-quarto

### If you need examples of typst code, read the *.qmd files in default directories and look for {=typst}
- Ignore any other *.typ files, unless the user specifically says to.

### Often, the user probably wants to add typst content to these default files:
- ~/code/docs/tech_notes/400_typst_simple_NOTES.qmd
- ~/code/docs/tech_notes/410_typst_MATH_notes.qmd

- The 400* file is mostly when user is demonstrating typst feature.
- The 410* file is for mathematics and probability/statistics.

### For graphs, the user likes fletcher package (Always check and use the latest version.)
### if cetz is requested:  Using cetz package for typst
- Be careful with using correct dependencies.  Example:  As of May 2026 cetz code below works.

- cetz.plot to plot!!

```{=typst}
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.3": plot 

#cetz.canvas({

  let range = (-3, 3)
  
  plot.plot(
    size: (6, 4), 
    x-tick-step: 1, 
    y-tick-step: 1, 
    {
      plot.add(
        domain: range, 
        x => x - 1,
        style: (stroke: blue)
      )
      plot.add(
        domain: range, 
        x => -x - 1,
        style: (stroke: red)
      )
    }
  )
})
```

### If the user says "update" or "add" and gives a filename:
- Default target is a quarto *.qmd file; only use a *.typ file if the user explicitly specifies one (and confirm first).
- If the user omits the *.qmd or *.typ filename, stop and report error: "Please provide a *.qmd (or *.typ) file"
- Otherwise, append the content to the bottom of that file.

### If the user does not say "update" or "add", then user must provide the name and directory for a new *.qmd file

- Example:  "Create a new *.qmd file called math.qmd in ~/code/docs/tech_notes/"

- If the user omits the *.qmd file or directory, stop and report error "Please provide *.qmd file and directory"


### When creating a new *.typ  or *.qmd *file:
- the new file should render each page as  "8 1/2 x 11" (US)
- make the margins small (top, bottom, left, right). The goal is to fit more content on each page.
- This should already be in the _quarto.yml file
