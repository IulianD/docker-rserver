FROM obiba/opal-rserver
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7'
RUN echo "deb http://cloud.r-project.org/bin/linux/debian buster-cran40/"> r.list
RUN apt-get update --allow-releaseinfo-change
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y r-base
