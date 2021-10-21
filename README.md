# Workshop: Data Train - Intro to ML

<!-- badges: start -->
<!-- badges: end -->

Workshop component to the [Machine Learning workshop in the Data Train
2021 series](https://www.uni-bremen.de/research-alliance/forschungsdaten/data-train/data-train-curriculum/data-scientist-track/ot-sc-ws-03-machine-learning).

Repository contains `.Rmd` notebooks for hands-on ML demos & exercises.  
Example code for exercises will be made available after the exercises.

## Workshop instructions:

In RStudio, enter

```r
usethis::create_from_github(repo = "https://github.com/bips-hb/datatrain_workshop_ml.git", fork = FALSE)
```

This will create a new RStudio project with the workshop materials.  
On the prepared RStudio server installation (<https://rstudio.informatik.uni-bremen.de/>),
all required R packages should be available.  
For local setup instructions, see further instructions below.

## Agenda

- 20.10.2021 + 21.10.2021
  - 9:00 - 12:00
  - 12:00 - 13:00 Break
  - 13:00 - 16:00

### Structure

- 4 * 3-hour blocks, each ~90min Theory, short break, ~90min Hands-on
- Hands-on locally or on RStudio server!
- Notebooks in this repository correspond to blocks in workshop

## Local Setup

If you want to follow the course on your own machine, first install the following packages:

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
  # Plotting / infrastructure
  "rmarkdown", "ggplot2", "patchwork", "usethis", "dplyr", "purrr"
)

# Install packages if not available already
sapply(packages, function(x) {
  if (!requireNamespace(x)) install.packages(x)
})
```

Assuming you already have a recent version of R installed. If not, see [CRAN](https://cran.r-project.org/)
for instructions appropriate to your platform.  

Afterwards you can create a local copy of this repository with the same method
as during the workshop (`usethis:: ...` see above) or clone the repository 
manually with 

```sh
git clone https://github.com/bips-hb/datatrain_workshop_ml.git
```

or via RStudio's `New Project -> Version Control` dialog.

### Linux Note

If you're working on a Linux distribution such as Ubuntu (or something Ubuntu-based),
you may have to install some system packages with `sudo apt-get install ...` beforehand.
To get the system requirements needed, you can use the `{remotes}` package like so:

```r
install.packages("remotes")

# Get system requirements for Ubuntu 20.04
pkgs <- sapply(packages, function(x) remotes::system_requirements("ubuntu-20.04", package = x))
cat(unique(unlist(pkgs)), sep = "\n")
```

Which will output the required `apt-get install` lines you can run to install everything.  
For Ubuntu 20.04, it would look like this, which you can run in the Terminal of your choice:

```sh
sudo apt-get install -y make
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y libglpk-dev
sudo apt-get install -y libgmp3-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libpng-dev
sudo apt-get install -y python
sudo apt-get install -y pandoc
sudo apt-get install -y libicu-dev
sudo apt-get install -y git
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libgit2-dev
```

## Reproducibility

As of the conclusion of the workshop, this repository includes an [`{renv}`](https://rstudio.github.io/renv/)
lock file to capture the specific package versions used. 
If this material is revisited in the future, running `renv::restore()` should
restore the appropriate package versions to ensure all the code examples 
still run as originally intended.
