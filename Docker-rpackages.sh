#!/bin/sh

# tidyverse and others
apt-get -y install libxml2-dev libcurl4-openssl-dev libssl-dev && \
  install2.r --error --deps TRUE \
    tidyverse \
    dplyr \
    ggplot2 \
    devtools \
    formatR \
    remotes \
    selectr \
    caTools && \
  install2.r --error --deps TRUE \
    purrrlyr \
    data.table && \
  installGithub.r \
    tidyverse/ggplot2 \
    jalvesaq/colorout

# # visualization
# installGithub.r ggobi/ggally#266 clauswilke/ggridges
#
# # models
# install2.r --error --deps TRUE \
#   mgcv \
#   lme4 \
#   gamlss \
#   R2BayesX
#
# # # bamlss
# # install2.r --error --deps TRUE \
# #   coda \
# #   MBA \
# #   sp \
# #   spam \
# #   bamlss \
