# Workshop: Data Train - Intro to ML

<!-- badges: start -->
<!-- badges: end -->

Workshop component to the [Machine Learning workshop in the Data Train
2023 series](https://www.bremen-research.de/data-train/courses/course-catalogue/course-details?event_id=44).

Repository contains `.Rmd` notebooks for hands-on ML demos & exercises.  
Example code for exercises will be made available after the exercises.

## Workshop Quick Start Instructions:

1. In RStudio, install the `usethis` package and enter

```r
usethis::create_from_github(repo = "https://github.com/bips-hb/datatrain_workshop_ml.git", fork = FALSE)
```

This will create a new RStudio project with the workshop materials.  
See more detailed installation instructions below.

2. Open the project and run `renv::restore()` to install required R packages.

If the following example code produces a plot, you're probably good to go:

```r
library(mlr3verse)
rr <- resample(tsk("sonar"), lrn("classif.ranger", predict_type = "prob"), rsmp("bootstrap", repeats = 5))
autoplot(rr, type = "prc")
```

(You'll learn what that piece of code does in the workshop :)

## Agenda

TBD

### Structure

- July 4+5, 2023, 9:00 AM - 5:00 PM
- UNICOM 7.1020, Large Seminar Room, Mary-Somerville-Str. 7, 28359 Bremen

Possibly subject to change: 

- 4 * 3-hour blocks, each ~90min Theory, short break, ~90min Hands-on
- Hands-on exercises on local devices, bring a laptop!
- Notebooks in this repository correspond to blocks in workshop

## Installation Instructions

1. Install R for your platform: https://cran.rstudio.com/
  - Installation instructions depend in whether you're using Windows, Linux (whichever flavor), or macOS.
2. Install RStudio Desktop: https://posit.co/download/rstudio-desktop/
3. Create a local copy of this workshop repository (`https://github.com/bips-hb/datatrain_workshop_ml.git`), using one of these options:
  - `usethis::create_from_github(repo = "https://github.com/bips-hb/datatrain_workshop_ml.git", fork = FALSE)` (as listed above)
  - Running `git clone https://github.com/bips-hb/datatrain_workshop_ml.git` in the terminal to clone the repository.
  - Using RStudio's `New Project -> Version Control` dialog.
  Use whichever option you are most familiar with, or the first one if unsure.

4. Install R packages required for the workshop by opening the workshop repository in RStudio (e.g. double-clicking the `datatrain_workshop_ml.Rproj` file) and run `renv::restore(prompt - = FALSE)`. [`{renv}`](https://rstudio.github.io/renv/) will automatically install all R packages with the correct versions listed in `renv.lock`.

In some cases, installation with `renv` might fail.
Should that be the case, delete the `.Rprofile` file or comment out the line `source("renv/activate.R")` in that file, and then refer to the manual package installation instructions below.

### Manual package installation instructions 

```r
packages <- c(
  # Data
  "palmerpenguins", "mlr3data",
  # Learner backends
  "ranger", "xgboost", "kknn", "rpart", "e1071", "randomForest",
  "mlr3verse", # installs "mlr3", "mlr3learners", "mlr3viz", "mlr3tuning" ...
  "precrec", # ROC plots via mlr3, not auto-installed with mlr3viz
  # Viz / interpretability
  "rpart.plot", "iml", "vip", "pdp",
  # Plotting / infrastructure, goodies
  "rmarkdown", "ggplot2", "patchwork", "usethis", "dplyr", "purrr", "ragg",
  "remotes", "styler"
)

# Install packages if not available already
sapply(packages, function(x) {
  if (!requireNamespace(x)) install.packages(x)
})
```

### Linux Note

If you're working on a Linux distribution such as Ubuntu (or something Ubuntu-based),
you may have to install some system packages with `sudo apt-get install ...` beforehand.
To get the system requirements needed, you can use the `{remotes}` package like so:

```r
install.packages("remotes")

# Get system requirements for Ubuntu 20.04 (the package names likely won't differ between releases)
pkgs <- sapply(packages, function(x) {
  remotes::system_requirements("ubuntu-20.04", package = x)
})
cat(unique(unlist(pkgs)), sep = "\n")
```

Which will output the required `apt-get install` lines you can run to install everything.  
For Ubuntu 20.04, it would look like this, which you can run in the terminal of your choice:

```sh
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y make
sudo apt-get install -y libglpk-dev
sudo apt-get install -y libgmp3-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libicu-dev
sudo apt-get install -y pandoc
sudo apt-get install -y git
sudo apt-get install -y libgit2-dev
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libfreetype6-dev
sudo apt-get install -y libfribidi-dev
sudo apt-get install -y libharfbuzz-dev
sudo apt-get install -y libfontconfig1-dev
sudo apt-get install -y libjpeg-dev
sudo apt-get install -y libpng-dev
sudo apt-get install -y libtiff-dev
```
