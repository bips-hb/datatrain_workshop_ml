# Detect Ubuntu version for RSPM and set CRAN repo accordingly
if (file.exists("/etc/os-release")) {
  x <- readLines("/etc/os-release")[[2]]

  if (grepl("Bionic", x)) {
    ubuntu <- "bionic"
  } else if (grepl("Focal", x)) {
    ubuntu <- "focal"
  } else {
    ubuntu <- NA
  }

  if (!is.na(ubuntu)) {
    options(repos = c(
      RSPM = sprintf("https://packagemanager.rstudio.com/all/__linux__/%s/latest", ubuntu)
    ))
  }
}


