# *A companion repository for my [SMBE 2021 poster](SMBE2021_poster.pdf)*

**Note: If you're having trouble getting hold of me during SMBE2021 poster sessions, feel free to reach out at _smbe2021@bodkan.net_. I'm more than happy to schedule a separate meeting on Zoom.**

**You can also take a look at the overview of the package functionality at the [project website](https://bodkan.net/slendr). This shows the same kind of simulation scenario shown in the poster, but everything is explain in more detail.**

------

This is a repository with simulation code examples for my SMBE 2021 poster about the new R package [*slendr*](https://github.com/bodkan/slendr). Below, you will find some information about running the examples yourself in a browser-based RStudio session, without having to install anything on your own computer.

If you're not interested in doing that but would still like to see what kinds of simulations are now possible, take a look at this animation which shows the recording of [a simple simulation](longer_example.R) of the past 50 thousand years of modern human history in West Eurasia. Dots are individuals as simulated by the SLiM backend script included in the package, and the final result is a complete spatially annotated tree-sequence recording from which simulated genomes can be easily generated.

![animated_gif](longer_example.gif)

A much more detailed explanation of the typical simulation workflow can be found on the [project's website](https://bodkan.net/slendr) and in the [tutorial](https://bodkan.net/slendr/articles/slendr.html).

## Running the code from our poster

You can open an RStudio session with the example script from our poster directly in your web browser (no installation needed):

[![Binder](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/bodkan/smbe2021/main?urlpath=rstudio)

In case the binder cloud instance appears to be starting very slowly, please be patient. The binder cloud server can sometimes take a minute to load up. Sometimes it even crashes completely. If that happens, try reloading the page - this will restart the binder session.

We provide two examples:

-   [`poster_example.R`](poster_example.R): a short example from the poster
-   [`longer_example.R`](longer_example.R): a longer, more interesting example adapted from the [tutorial](https://bodkan.net/slendr/articles/slendr.html) vignette which generated the simulation above

Once the browser-based RStudio session loads, you can open those scripts from the RStudio file browser and try them for yourself.

## Project website

You can find extensive documentation at the [project's website](https://bodkan.net/slendr), such as the [manual pages](https://bodkan.net/slendr/reference/index.html) and a detailed [tutorial](https://bodkan.net/slendr/articles/slendr.html). Everything is still work in progress and we are actively fixing bugs and adding new features. If you are interested in using our software once things become more stable, checking out the project website for updates regularly is a good idea.

## GitHub repository

The GitHub repository of the project is located [here](https://github.com/bodkan/slendr). In case you run into any bugs or if you would like to suggest a new feature, please feel free to open an [issue](https://github.com/bodkan/slendr/issues).

## Contact information

You can find my contact information on my personal [website](https://bodkan.net). Once this package reaches a first stable version, I will be posting updates on my [Twitter](https://twitter.com/fleventy5).
