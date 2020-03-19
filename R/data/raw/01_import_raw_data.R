#
# Author:   Cristian E. Nuno
# Purpose:  Import raw data sets
# Date:     March 18, 2020
#

# load necessary packages ----
library(here)

# load necessary data ----

# CPS School Profile Info, SY1819 Permalink found here:
#   https://data.cityofchicago.org/Education/Chicago-Public-Schools-School-Profile-Information-/kh4r-387c
download.file(url = "https://data.cityofchicago.org/api/views/kh4r-387c/rows.csv?accessType=DOWNLOAD",
              destfile = here("data/raw/cps_profile_sy1819.csv"))

# end of script #
