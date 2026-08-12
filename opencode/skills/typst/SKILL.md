---
name: typst
description: Use this skill whenever the users says to use "typst" or says "*.typ".
---

## typst


### Be terse.   Before making any changes to file, present a plan to user.  Do not guess, ask the user questions.

### Default directories for *.typ files are:
- ~/code/docs/tech_notes/
- ~/code/publish_project/typst/ or ~/code/publish_project/typst-quarto

### If you need examples of *.typ file, read the *.typ files in default directories
- Ignore any other *.typ files, unless the user specifically says to.

### Often, the user probably wants to add typst content to these default files:
- ~/code/docs/tech_notes/400_typst_simple_NOTES.typ
- ~/code/docs/tech_notes/410_typst_MATH_notes.typ

- The 400* file is mostly when user is demonstrating typst feature.
- The 410* file is for mathematics and probability/statistics.

### Using cetz package for typst
- Be careful with using correct dependencies.  Example:  As of May 2026 cetz code below works.

- cetz.plot to plot!!

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

### If the user also says "update" or "add" and gives a filename (extension must be *.typ):
- If the user omits the *.typ file, stop and report error "Please provide *.typ file" 
- Otherwise, add to the formatted text to bottom of *.typ file

### If the user does not say "update" or "add", then user must provide the name and directory for a new *.typ file

- Example:  "Create a new typst file called "math.typ" in ~/code/docs/tech_notes/

- If the user omits the *.typ file or directory, stop and report error "Please provide *.typ file and directory"


### When creating a new *.typ file:
- the new file should render each page as  "8 1/2 x 11" (US)
- make the margins small (top, bottom, left, right). The goal is to fit more content on each page.
