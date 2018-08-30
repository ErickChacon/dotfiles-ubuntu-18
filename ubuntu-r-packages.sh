#!/bin/sh

# tidyverse
sudo apt-get install libxml2-dev -y
echo "install.packages(\"tidyverse\")" > r-packages.R
echo "devtools::install_github(\"tidyverse/ggplot2\")" >> r-packages.R
echo "install.packages(\"purrrlyr\")" >> r-packages.R
echo "install.packages(\"data.table\")" >> r-packages.R
R CMD BATCH r-packages.R

# ggplot extensions
echo "install.packages(\"ggrepel\")" > r-packages.R
R CMD BATCH r-packages.R

# visualization
# echo "devtools::install_github(\"ggobi/GGally\")" > r-packages.R
# echo "install.packages(\"GGally\")" > r-packages.R
echo "devtools::install_github(\"ggobi/ggally#266\")" > r-packages.R
echo "devtools::install_github(\"clauswilke/ggridges\")" >> r-packages.R
R CMD BATCH r-packages.R

# models
echo "install.packages(\"mgcv\")" > r-packages.R
echo "install.packages(\"lme4\")" > r-packages.R
echo "install.packages(\"gamlss\")" >> r-packages.R
echo "install.packages(\"R2BayesX\")" >> r-packages.R
R CMD BATCH r-packages.R

# bamlss
echo "install.packages(\"coda\")" > r-packages.R
echo "install.packages(\"MBA\")" >> r-packages.R
echo "install.packages(\"sp\")" >> r-packages.R
echo "install.packages(\"spam\")" >> r-packages.R
echo "install.packages(\"bamlss\", \
  repos=\"http://R-Forge.R-project.org\")" >> r-packages.R
R CMD BATCH r-packages.R

# tables
echo "install.packages(\"gridExtra\")" > r-packages.R
R CMD BATCH r-packages.R

# github packages
git clone https://github.com/ErickChacon/day2day.git
R CMD INSTALL day2day
rm -rf day2day

# sf package
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable -y
sudo apt-get update
sudo apt-get install libgdal-dev libgeos-dev libproj-dev libudunits2-dev \
  liblwgeom-dev -y
echo "install.packages(\"sf\")" > r-packages.R
R CMD BATCH r-packages.R

echo "install.packages(\"lwgeom\")" > r-packages.R
R CMD BATCH r-packages.R


# spatial packages
echo "install.packages(\"spatstat\")" > r-packages.R
echo "install.packages(\"fields\")" >> r-packages.R
echo "install.packages(\"maptools\")" >> r-packages.R
echo "install.packages(\"raster\")" >> r-packages.R
echo "install.packages(\"gstat\")" >> r-packages.R
echo "install.packages(\"ggmap\")" >> r-packages.R
echo "install.packages(\"rgdal\")" >> r-packages.R
echo "install.packages(\"rgeos\")" >> r-packages.R
echo "install.packages(\"spdep\")" >> r-packages.R
R CMD BATCH r-packages.R

# spatial visualization
sudo apt-get install -y libv8-3.14-dev
sudo add-apt-repository -y ppa:opencpu/jq
sudo apt-get update -q
sudo apt-get install -y libjq-dev
sudo apt-get install -y libprotobuf-dev protobuf-compiler
sudo apt-get install -y libssl-dev
sudo apt-get install -y libcairo2-dev
echo "devtools::install_github(\"mtennekes/tmaptools\")" > r-packages.R
echo "devtools::install_github(\"mtennekes/tmap\")" >> r-packages.R
R CMD BATCH r-packages.R

sudo apt-get install -y r-cran-rjava
echo "install.packages(\"OpenStreetMap\")" > r-packages.R
R CMD BATCH r-packages.R

# spatial related packages
echo "install.packages(\"pdist\")" > r-packages.R
R CMD BATCH r-packages.R

# visualization
echo "install.packages(\"viridis\")" > r-packages.R
R CMD BATCH r-packages.R

# code efficiency
echo "install.packages(\"microbenchmark\")" > r-packages.R
echo "install.packages(\"rbenchmark\")" >> r-packages.R
R CMD BATCH r-packages.R

# database connection
echo "install.packages(\"rredis\")" > r-packages.R
R CMD BATCH r-packages.R

# get database
# echo "install.packages(\"trmm\")" > r-packages.R
# R CMD BATCH r-packages.R

# web and markdown
echo "install.packages(\"blogdown\")" > r-packages.R
echo "blogdown::install_hugo()" >> r-packages.R
echo "install.packages(\"formatR\")" >> r-packages.R
R CMD BATCH r-packages.R

# c++ integration
sudo apt-get install r-cran-rcpp r-cran-rcpparmadillo r-cran-rcppeigen \
  r-cran-rinside r-cran-inline -y

# python integration
echo "install.packages(\"reticulate\")" > r-packages.R
R CMD BATCH r-packages.R

# mcmc samplers
echo "install.packages(\"nimble\")" > r-packages.R
R CMD BATCH r-packages.R

# mcmc samplers STAN

echo "dotR <- file.path(Sys.getenv(\"HOME\"), \".R\")" > r-packages.R
echo "if (!file.exists(dotR)) dir.create(dotR)" >> r-packages.R
echo "M <- file.path(dotR, \"Makevars\")" >> r-packages.R
echo "if (!file.exists(M)) file.create(M)" >> r-packages.R
echo "cat(paste0(\"\nCXXFLAGS=-O3 -mtune=native -march=native\"," >> r-packages.R
echo "           \" -Wno-unused-variable -Wno-unused-function\")," >> r-packages.R
echo "    file = M, sep = \"\n\", append = TRUE)" >> r-packages.R
echo "cat(paste0(\"\nCXXFLAGS+=-flto -ffat-lto-objects \"," >> r-packages.R
echo "           \" -Wno-unused-local-typedefs\")," >> r-packages.R
echo "    file = M, sep = \"\n\", append = TRUE)" >> r-packages.R
echo "cat(readLines(M), sep = \"\n\")" >> r-packages.R
echo "cat(M)" >> r-packages.R
echo "" >> r-packages.R
echo "install.packages(\"rstan\"," >> r-packages.R
echo "  repos = \"https://cloud.r-project.org/\"," >> r-packages.R
echo "  dependencies = TRUE)" >> r-packages.R
echo "fx <- inline::cxxfunction(" >> r-packages.R
echo "  signature(x = \"integer\", y = \"numeric\" )," >> r-packages.R
echo "  'return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;' )" >> r-packages.R
echo "fx( 2L, 5 ) # should be 10" >> r-packages.R
R CMD BATCH r-packages.R

# mcmc samplers
echo "install.packages(\"MCMCpack\")" > r-packages.R
R CMD BATCH r-packages.R

# mcmc packages
echo "install.packages(\"spBayes\")" > r-packages.R
R CMD BATCH r-packages.R

# binary data
echo "install.packages(\"vcd\")" > r-packages.R
echo "install.packages(\"mirt\")" >> r-packages.R
echo "install.packages(\"polycor\")" >> r-packages.R
echo "install.packages(\"eRm\")" >> r-packages.R
echo "install.packages(\"ltm\")" >> r-packages.R
R CMD BATCH r-packages.R

# structural equation models
echo "install.packages(\"lavaan\")" >> r-packages.R
R CMD BATCH r-packages.R

# package development
echo "install.packages(\"testthat\")" > r-packages.R
R CMD BATCH r-packages.R

# language client
echo "devtools::install_github(\"jimhester/lintr\")" > r-packages.R
echo "source(\"https://install-github.me/REditorSupport/languageserver\")" \
  > r-packages.R
R CMD BATCH r-packages.R


# exploratory data analysis
echo "install.packages(\"corrplot\")" > r-packages.R
R CMD BATCH r-packages.R

# additional distributions
echo "install.packages(\"truncnorm\")" > r-packages.R
echo "devtools::install_github(repo = \"olmjo/RcppTN\",
    ref = \"development\")" >> r-packages.R
R CMD BATCH r-packages.R

# Dependencies for openstreetmap
sudo apt-get install libcgal-dev libglu1-mesa libglu1-mesa-dev -y

# survival analysis
sudo apt-get install r-cran-rjava -y
echo "install.packages(\"spatsurv\")" > r-packages.R
R CMD BATCH r-packages.R

# # references
# echo "install.packages(\"RefManageR\")" >> r-packages.R
# R CMD BATCH r-packages.R

# hdf5
echo "source(\"http://bioconductor.org/biocLite.R\")" > r-packages.R
echo "biocLite(\"rhdf5\")" >> r-packages.R
R CMD BATCH r-packages.R

# dags
sudo apt-get install -y libv8-3.14-dev librsvg2-dev
echo "devtools::install_github(\"rich-iannone/DiagrammeR\")" > r-packages.R
echo "devtools::install_github(\"rich-iannone/DiagrammeRsvg\")" >> r-packages.R
echo "install.packages(\"rsvg\")" >> r-packages.R
echo "install.packages(\"dagitty\")" >> r-packages.R
R CMD BATCH r-packages.R

