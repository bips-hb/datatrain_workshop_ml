FROM rocker/verse:4.3.0

RUN install2.r --error --skipmissing --deps TRUE --skipinstalled -n -1 \
    mlr3verse \
    xgboost ranger kknn \
    pak \
    renv jsonlite yaml \
    rpart rpart.plot e1071 randomForest \
    precrec apcluster iml \
    styler commonmark markdown \
    patchwork usethis ggplot2 ragg

ENV IN_DOCKER=TRUE

WORKDIR /home/rstudio
