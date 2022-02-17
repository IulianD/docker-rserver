FROM obiba/opal-rserver
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7'
RUN echo "deb http://cloud.r-project.org/bin/linux/debian buster-cran40/"> r.list
RUN apt-get update --allow-releaseinfo-change
RUN apt-get update &&  DEBIAN_FRONTEND=noninteractive apt-get install -y r-base libjq-dev cmake
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
RUN gosu rserver Rscript -e "source('/srv/conf/Rprofile.R'); update.packages(repos=c('https://cloud.r-project.org'), lib.loc='/srv_local/R/library'); install.packages(c('Rcpp','RSQLite', 'mongolite','RPresto', 'vctrs', 'RMariaDB' , 'RPostgres','RANN','ranger', 'RCurl', 'jsonlite', 'party', 'testthat', 'synthpop', 'nloptr','party', 'dplyr'), repos=c('https://cloud.r-project.org'), lib = '/srv/R/library')"
