# Data Train: Introduction to Machine Learning

<!-- badges: start -->
<!-- badges: end -->

This is the workshop component to the [Machine Learning workshop in the Data Train
2025 series](https://www.bremen-research.de/data-train/courses/course-details?event_id=114).

Repository contains [Quarto](https://quarto.org/) `.qmd` notebooks for hands-on ML demos & exercises.  
Example code for exercises will be made available after the exercises.

## Workshop Quick Start Instructions:

We will use R version **4.5.1**, but recent versions >= 4.1 should still work.

1. get the materials: In RStudio, install the `usethis` package and enter

```r
usethis::create_from_github(repo = "https://github.com/bips-hb/datatrain_workshop_ml.git")
```

This will create a new RStudio project with the workshop materials on your local machine, and it will also fork the repository to your GitHub account (you can suppress this with `fork = FALSE` but there's no harm in forking).  

2. Install dependencies: Open the project and run `renv::restore(prompt = FALSE)` to install required R packages.


3. Verify: If the following example code produces a plot, you're probably good to go:

```r
library(mlr3verse)
rr <- resample(tsk("sonar"), lrn("classif.ranger", predict_type = "prob"), rsmp("bootstrap", repeats = 5))
autoplot(rr, type = "prc")
```

(You'll learn what that piece of code does in the workshop :)

For more detailed (and alternative) setup instructions, please [refer to the course website](https://bips-hb.github.io/datatrain_workshop_ml).

# Workshop Details

- July 14+15, 2025, 9:00 AM - 5:00 PM
- UNICOM 2, Small Seminar Room 2.207, Mary-Somerville-Str. 2, 28359 Bremen

- 4 * 3-hour blocks, each ~90min theory, short break, ~90min hands-on
- Hands-on exercises on local devices, **bring a laptop**!

## Day 1

- Theory / practice: 9:00 - 12:00
  - k-Nearest-Neighbors
  - General concepts
  - Decision Trees
- Break: 12:00 - 13:00
- Theory / practice: 13:00 - 17:00
  - Random Forest
  - Model evaluation
  - Boosting

## Day 2

- Theory / practice: 9:00 - 12:00
  - Support Vector Machines (SVM)
  - Hyperparameter Tuning
  - Artifical Neural Networks
- Break: 12:00 - 13:00
- Theory / practice: 13:00 - 17:00
  - Specific endpoints
  - Variable Importance
  - Discussion

# Further Reading

## Code examples

We rely on the mlr3 framework and its free online book for the hands-on part of the workshop:

- [Bischl, B., Sonabend, R., Kotthoff, L., & Lang, M. *Applied Machine Learning Using mlr3 in R*. (CRC Press, 2024)](https://mlr3book.mlr-org.com)

## Free Lectures (online with slides + videos)

Lecture materials take inspiration from these free and open-source lectures:

- Introduction to Machine Learning ("I2ML"): https://slds-lmu.github.io/i2ml
- Interpretable Machine Learning: https://slds-lmu.github.io/iml

## Textbooks

- [An Introduction to Statistical Learning: with Applications in R. (Springer, 2013).](https://www.statlearning.com/)
- [Hastie, T., Tibshirani, R. & Friedman, J. The Elements of Statistical Learning: Data Mining, Inference, and Prediction, Second Edition. (Springer, 2009).](https://web.stanford.edu/~hastie/ElemStatLearn/)
- [Murphy, K. P. Machine Learning: A Probabilistic Perspective. (MIT Press, 2012).](https://probml.github.io/pml-book/)
- [Bishop, C. M. Pattern Recognition and Machine Learning. Information Science and Statistics. (Springer, 2006).](https://link.springer.com/book/9780387310732)
- [Molnar, M. Interpretable Machine Learning: A Guide for Making Black Box Models Explainable (2023)](https://christophm.github.io/interpretable-ml-book/)
