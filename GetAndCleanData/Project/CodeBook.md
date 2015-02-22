---
title: "CodeBook.md"
author: "Gaurav Srivastava"
date: "February 21, 2015"
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

Since the 'Train'(70%) and the 'Test'(30%) sets were created by randomly partitioning the volunteers into two sets, they are mutually exclusive observations and cannot be merged based on some ID. Instead, each subset within these two sets 
subject_*.txt
X_*.txt
y_*.txt
Intertial Signals
can be merged into a single dataset by row binding.



