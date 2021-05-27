FROM rocker/binder:4.0.5

ARG NB_USER=mp
ARG NB_UID=1000

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
