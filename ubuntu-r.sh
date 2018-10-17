
# pandoc
sudo apt-get install -y pandoc pandoc-citeproc evince

# prepare repository
sudo apt-get install apt-transport-https
  echo -e "\n## Mirror for R software" | sudo tee -a /etc/apt/sources.list && \
  sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/"

# add key for the repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
  E298A3A825C0D65DFD57CBB651716619E084DAB9

# install
sudo apt-get update && \
  sudo apt-get install -y littler r-cran-littler r-base r-base-dev r-recommended && \
  echo 'options(repos = c(CRAN = "https://cloud.r-project.org/"), download.file.method = "libcurl")' |\
    sudo tee /etc/R/Rprofile.site && \
  echo 'source("/etc/R/Rprofile.site")' | sudo tee -a /etc/littler.r && \
  sudo ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r && \
  sudo ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r && \
  sudo ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r && \
  sudo ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r && \
  sudo install.r docopt

# rstudio
sudo apt-get install -y wget
rstudio_deb="rstudio-xenial-1.1.456-amd64.deb"
wget https://download1.rstudio.org/$rstudio_deb
sudo apt-get install libjpeg62 -y
sudo dpkg -i $rstudio_deb
rm $rstudio_deb


# # devtools
# echo "
# userdir <- unlist(strsplit(Sys.getenv(\"R_LIBS_USER\"), .Platform\$path.sep))[1L]
# dir.create(userdir, recursive = TRUE)
# .libPaths(c(userdir, .libPaths()))
# " > r-packages.R
# R CMD BATCH r-packages.R
# rm r-packages.R
#
# # initial settings
# echo "
# local({
# r <- getOption(\"repos\")
# r[\"CRAN\"] <- \"http://cloud.r-project.org/\"
# options(repos = r)
# })" | sudo tee /etc/R/Rprofile.site
#
# # # devtools
# # echo "
# # userdir <- unlist(strsplit(Sys.getenv(\"R_LIBS_USER\"), .Platform\$path.sep))[1L]
# # dir.create(userdir, recursive = TRUE)
# # .libPaths(c(userdir, .libPaths()))
# # install.packages(\"devtools\")
# # " > r-packages.R
# # sudo apt-get install libcurl4-openssl-dev libssl-dev -y
# # R CMD BATCH r-packages.R
# # rm r-packages.R
#
#
#
# # tidyverse and others
# sudo apt-get update && \
#   sudo apt-get -y install \
#   libxml2-dev \
#   libcairo2-dev \
#   libsqlite3-dev \
#   libmariadbd-dev \
#   libmariadb-client-lgpl-dev \
#   libpq-dev \
#   libssh2-1-dev \
#   unixodbc-dev \
#   libssl-dev \
#   libcurl4-openssl-dev && \
#   my-install2.r --error --deps TRUE --libloc ~/R/x86_64-pc-linux-gnu-library/3.5\
#     tidyverse \
#     dplyr \
#     ggplot2 \
#     devtools \
#     formatR \
#     remotes \
#     selectr \
#     caTools && \
#   install2.r --error --deps TRUE --libloc ~/R/x86_64-pc-linux-gnu-library/3.5\
#     purrrlyr \
#     data.table && \
#   installGithub.r \
#     tidyverse/ggplot2 \
#     jalvesaq/colorout
#
#
# # # colorout for R
# # git clone --depth 1 https://github.com/jalvesaq/colorout.git
# # R CMD INSTALL colorout
# # rm -rf colorout
#
# # # openblas for multi-thread
# # sudo apt-get update && sudo apt-get install -y libopenblas-base libopenblas-dev
# #
