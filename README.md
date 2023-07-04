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

2. Open the project and run `renv::restore(prompt = FALSE)` to install required R packages.

If the following example code produces a plot, you're probably good to go:

```r
library(mlr3verse)
rr <- resample(tsk("sonar"), lrn("classif.ranger", predict_type = "prob"), rsmp("bootstrap", repeats = 5))
autoplot(rr, type = "prc")
```

(You'll learn what that piece of code does in the workshop :)

## Workshop Details

- July 4+5, 2023, 9:00 AM - 5:00 PM
- UNICOM 7.1020, Large Seminar Room, Mary-Somerville-Str. 7, 28359 Bremen

- 4 * 3-hour blocks, each ~90min theory, short break, ~90min hands-on
- Hands-on exercises on local devices, bring a laptop!
- Notebooks in this repository correspond to blocks in workshop

### Day 1

- Theory / practice: 9:00 - 12:00
  - k-Nearest-Neighbors
  - General concepts
  - Decision Trees
- Break: 12:00 - 13:00
- Theory / practice: 13:00 - 17:00
  - Random Forest
  - Model evaluation
  - Boosting

### Day 2

- Theory / practice: 9:00 - 12:00
  - Support Vector Machines (SVM)
  - Hyperparameter Tuning
  - Artifical Neural Networks
- Break: 12:00 - 13:00
- Theory / practice: 13:00 - 17:00
  - Specific endpoints
  - Variable Importance
  - Discussion


## Installation Instructions

1. Install R for your platform: <https://cran.r-project.org/>
  - Installation instructions depend in whether you're using Windows, Linux (whichever flavor), or macOS.
  - We assume R version 4.3.0 but all recent versions should work fine.
2. Install RStudio Desktop: <https://posit.co/download/rstudio-desktop/>
3. Create a local copy of this workshop repository (`https://github.com/bips-hb/datatrain_workshop_ml.git`), 
    using any one of these options (use whichever you are most familiar with):
  a) Using R and the `usethis` package: `usethis::create_from_github(repo = "https://github.com/bips-hb/datatrain_workshop_ml.git", fork = FALSE)`
  b) Running this in the terminal: `git clone https://github.com/bips-hb/datatrain_workshop_ml.git`
  c) Using RStudio's `New Project -> Version Control` dialog to clone the repository.  

4. Install R packages required for the workshop by opening the workshop repository in RStudio (e.g. double-clicking the `datatrain_workshop_ml.Rproj` file)  
and run `renv::restore(prompt = FALSE)`.  
[`{renv}`](https://rstudio.github.io/renv/) will automatically install all R packages with the correct versions listed in `renv.lock`.

In some cases, installation with `renv` might fail.
Should that be the case, delete the `.Rprofile` file or comment out the line `source("renv/activate.R")` in that file, and then refer to the manual package installation instructions below.

### Manual package installation instructions 

You should only need to install all packages manually if you were not able to use `renv` to install them automatically. 
(Or if you're trying to get this code to run in a different environment than this repository)

```r
packages <- c(
  # Data
  "palmerpenguins", "mlr3data",
  # Learner backends
  "ranger", "xgboost", "kknn", "rpart", "e1071", "randomForest",
  "mlr3verse", # installs "mlr3", "mlr3learners", "mlr3viz", "mlr3tuning" ...
  "precrec", # ROC plots via mlr3, not auto-installed with mlr3viz
  "apcluster",
  # Viz / interpretability
  "rpart.plot", "iml", # "vip", "pdp",
  # Plotting / infrastructure, goodies
  "rmarkdown", "ggplot2", "patchwork", "usethis", "dplyr", "purrr", "ragg",
  "remotes", "styler"
)

# Install packages if not available already
sapply(packages, function(x) {
  if (!requireNamespace(x)) install.packages(x)
})
```


You can also try using [`{pak}`](https://pak.r-lib.org/dev/index.html) for installation, which may try to automatically install system dependencies on Linux (see next note) if possible:

```r
install.packages("pak")

pak::pak(packages)
```

### Linux Note

If you're working on a Linux distribution such as Ubuntu (or something Ubuntu-based),
you may have to install some system packages with `sudo apt-get install ...` beforehand.
To get the system requirements needed, you can use the `{remotes}` package like so:

```r
install.packages("remotes")

# Get system requirements for Ubuntu 20.04 (the package names likely won't differ between releases)
pkg_reqs <- sapply(packages, function(x) {
  remotes::system_requirements("ubuntu-20.04", package = x)
})

cat(paste("sudo", sort(unique(unlist(pkg_reqs))), collapse = "\n"))
```

Which will output the required `apt-get install` lines you can run to install everything.  
For Ubunt 22.04, it would look like this, which you can run in the terminal of your choice:

```sh
sudo apt-get install -y git
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libfontconfig1-dev
sudo apt-get install -y libfreetype6-dev
sudo apt-get install -y libfribidi-dev
sudo apt-get install -y libgit2-dev
sudo apt-get install -y libglpk-dev
sudo apt-get install -y libgmp3-dev
sudo apt-get install -y libharfbuzz-dev
sudo apt-get install -y libicu-dev
sudo apt-get install -y libjpeg-dev
sudo apt-get install -y libpng-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libtiff-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y make
sudo apt-get install -y pandoc
sudo apt-get install -y zlib1g-dev
```

### Using docker

If the installation instructions above fail for some reason, you can try using [Docker](https://docs.docker.com/get-started/overview/) as a sort of last resort.
You can find out how to install it at <https://docs.docker.com/engine/install/>.
For some more information specifically in the context of R, you can skim <https://solutions.posit.co/envs-pkgs/environments/docker/>, and for the popular set of images available from the `rocker` project, see <https://rocker-project.org/images/>.

The included [`Dockerfile`](Dockerfile) will create an image will the required packages and dependencies all installed, and afterwards it launches an RStudio server instance you cann access via your browser.

Build the image with this command:

```sh
docker build -t self/mlworkshop:1.0 .
```

On an arm64 Mac (with an M1 or M2 processor), you will need to run the following instead:

```sh
docker build --platform linux/amd64 -t self/mlworkshop:1.0 .
```

Building the image will take a few minutes, but at least you won't have compilation issues.

Afterwards you can run the image with this command, which will make the workshop materials in the current directory (`$(pwd)`) available at the home directory where the RStudio instance will start at (`/home/rstudio/`). It also sets the port where the server will be available to you in the browser (the `8787` on the left side of the `:`, do not change the right side!), and it disables password authentication for simplicity.

```sh
docker run \
  -v "$(pwd):/home/rstudio/" \
  -p 8787:8787 \
  -e DISABLE_AUTH=true \
  self/mlworkshop:1.0
```

Once it's running, visit <http://localhost:8787> in your browser and you should be greeted by an RStudio window.
This repository is set up such that it tries to detect whether you're running inside a Docker container and will not load `renv` in that case, as that would only make things more complicated.

# Further Reading

- Introduction to Machine Learning (I2ML): https://slds-lmu.github.io/i2ml
  - Free online lecture series with slides & videos, covers basic to advanced topics
- mlr3book: https://mlr3book.mlr-org.com
  - For all the mlr3 stuff

