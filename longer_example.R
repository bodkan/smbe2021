# This script contains a longer example of a spatial model
# adapted from the vignette tutorial at:
# https://bodkan.net/slendr/articles/tutorial.html
#
# You might find this example more interesting than the much
# shortened demo from the poster (which you can find in poster-example.R
# in the root of this repository).

# the package is already installed and we can simply load it
library(slendr)

# 1. spatial context ------------------------------------------------------

map <- world(
  xrange = c(-15, 60), yrange = c(20, 65),
  landscape = "naturalearth",
  crs = "EPSG:3035"
)

# 'plot' is our generic function able to plot all spatial objects
# created by this package
plot(map)

# geographic regions used later to define population boundaries
africa <- region(
  "Africa", map,
  polygon = list(c(-18, 20), c(40, 20), c(30, 33),
                 c(20, 33), c(10, 38), c(-8, 35))
)
europe <- region(
  "Europe", map,
  polygon = list(
    c(-8, 35), c(-5, 36), c(10, 38), c(20, 35), c(25, 35),
    c(33, 45), c(20, 58), c(-5, 60), c(-15, 50)
  )
)
anatolia <- region(
  "Anatolia", map,
  polygon = list(c(28, 35), c(40, 35), c(42, 40),
                 c(30, 43), c(27, 40), c(25, 38))
)
plot(africa, europe, anatolia)

# 2. population dynamics --------------------------------------------------

# in order to make it possible to run the whole simulation using the
# restricted resources of the free cloud binder instance we dramatically
# decreased the number of individuals in each population `N`

afr <- population(
  "AFR", parent = "ancestor", time = 52000, N = 10000,
  competition_dist = 250e3, mate_dist = 200e3,
  offspring_dist = 70e3,
  map = map, polygon = africa
)
plot(afr)

ooa <- population(
  "OOA", parent = afr, time = 51000, N = 1000, remove = 14000,
  center = c(33, 30), radius = 400e3
) %>%
  move(trajectory = list(c(40, 30), c(50, 30), c(60, 40)),
       start = 50000, end = 40000, snapshots = 30)
plot(ooa)

ehg <- population(
  "EHG", parent = ooa, time = 28000, N = 4000, remove = 5000,
  polygon = list(
    c(26, 55), c(38, 53), c(48, 53), c(60, 53),
    c(60, 60), c(48, 63), c(38, 63), c(26, 60)
  )
)
plot(ehg)

eur <- population(
  name = "EUR", parent = ehg, time = 25000, N = 5000,
  polygon = europe,
  competition_dist = 400e3, mate_dist = 200e3, offspring_dist = 25e3
) %>%
  resize(N = 10000, time = 5000)
plot(eur)

ana <- population(
  name = "ANA", time = 28000, N = 5000, parent = ooa, remove = 5000,
  center = c(34, 38), radius = 500e3, polygon = anatolia
) %>%
  expand(
    by = 2500e3, start = 10000, end = 7000,
    polygon = join(europe, anatolia), snapshots = 20)
plot(ana)

yam <- population(
  name = "YAM", time = 7000, N = 2000, parent = ehg,
  polygon = list(c(26, 50), c(38, 49), c(48, 50),
                 c(48, 56), c(38, 59), c(26, 56))
) %>%
  move(trajectory = c(15, 50),start = 5000, end = 3000, snapshots = 10)
plot(yam)

# 3. geneflow events ------------------------------------------------------

geneflows <- list(
  geneflow(from = ana, to = yam, rate = 0.5, start = 6500, end = 6400),
  geneflow(from = ana, to = eur, rate = 0.5, start = 8000, end = 6000),
  geneflow(from = yam, to = eur, rate = 0.75, start = 4000, end = 3000)
)

# 4. model compilation ----------------------------------------------------

model <- compile(
  populations = list(afr, ooa, ehg, ana, eur, yam), geneflow = geneflows,
  generation_time = 30, resolution = 10e3,
  competition_dist = 200e3, mate_dist = 200e3, offspring_dist = 70e3,
  dir = "/tmp/demo-model/", overwrite = TRUE
)

model # when printed, model objects present a brief summary

# 5. model visualization --------------------------------------------------

# open the shiny explorer (you might get a note about a website trying
# to open a popup window)
explore(model)

# 6. execution in SLiM ----------------------------------------------------

slim(
  model, seq_length = 1, recomb_rate = 0,
  save_locations = TRUE, track_ancestry = F,
  method = "batch", verbose = TRUE
)
