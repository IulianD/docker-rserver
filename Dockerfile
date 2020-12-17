FROM obiba/opal-rserver
RUN mkdir /srv_local
RUN chown rserver /srv_local
RUN usermod -d /srv_local rserver
RUN mv /srv/* /srv_local/
RUN sed -i 's/srv/srv_local/g'  /srv_local/conf/Rprofile.R
RUN sed -i 's/srv/srv_local/g'  /srv_local/conf/Rserv.conf
RUN gosu rserver Rscript -e "source('/srv_local/conf/Rprofile.R'); devtools::install_github(c('sib-swiss/dsSwissKnife','vanduttran/dsSSCPclient', 'vanduttran/dsSSCP'), repos=c('https://cloud.r-project.org'), lib='/srv_local/R/library'); install.packages('VIM', lib='/srv_local/R/library')"
