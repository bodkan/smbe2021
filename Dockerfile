FROM rocker/verse:4.0.5

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

RUN /rocker_scripts/install_geospatial.sh

## Run an install.R script, if it exists.
#RUN if [ -f install.R ]; then R --quiet -f install.R; fi
