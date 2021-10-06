# Workshop: Data Train Intro to ML

<!-- badges: start -->
<!-- badges: end -->

Workshop component to the Machine Learning workshop in the Data Train
2021 series.

Repository contains Rmd notebooks for hands-on ML exercises.

## [Agenda](https://github.com/bips-hb/lehre_datatrain)

### Schedule

20.10.2021: 9:00-12:00 | 12:00-13:00 Break | 13:00-16:00
21.10.2021: 9:00-12:00 | 12:00-13:00 Break | 13:00-16:00

### Concept

* 4 3-hour blocks, each ~90min Theory, short break, ~90min Hands-on
* Hands-on in RStudio server! 

### Day 1, morning

* Machine: k-nearest neighbors
* Concept: Supervised learning; Learner, model, etc.
* Machine: Decision trees

- Hands-on:
  - Introduce penguin data for familiarity
  - kNN via `{kknn}` and penguins
  - Decision trees via `rpart`
  - Switching gears to `{mlr3}`, repeating/expanding on kNN + trees

### Day 1, afternoon

* Machine: Random forest
* Concept: Model evaluation, Resampling
* Machine: Boosting

- Hands-on:
  - Introduce more mlr3 premade tasks, switch to spam task
  - CV-based model evaluation
    - Introduce with kknn and rpart
  - Forests and Boosting
  - Comparing RF and xgboost with kNN and trees?

### Day 2, morning

* Machine: SVMs 
* Concept: Parameter tuning
* Machine: Neural nets

- Hands-on:
  - SVMs
  - Parameter tuning on kNN, xgboost? SVM?

### Day 2, afternoon
* Concept: Specific endpoints; Regression, Multiclass, survival
* Concept: Variable importance, variable selection, IML (outlook)

- Hands-on:
  - Not sure what to do here yet
  - Maybe use some `{mlr3data}` datasets with various outcome types?
