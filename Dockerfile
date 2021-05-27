## Use a tag instead of "latest" for reproducibility
FROM rocker/binder:latest

## Copies your repo files into the Docker Container
COPY --chown=rstudio:rstudio . ${HOME}

## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
