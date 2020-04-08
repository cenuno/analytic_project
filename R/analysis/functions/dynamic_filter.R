#
# Author:   Cristian E. Nuno
# Purpose:  Return a filtered data frame to the user
# Date:     April 8, 2020
#

# create function ----
filter_df <- function(df, keyword, column_name) {
  # Return a df that only keeps words in keyword
  #
  # Arguments
  #   - df:           a data frame
  #   - keyword:      a character vector that represents a value of interest
  #   - column_name:  a character vector that represents a column
  #
  # Return
  #   - a data frame
  
  # filter the df based on records that contain the keyword
  # in the given column_name.
  tmp_df <- dplyr::filter(df, 
                          # note: the use of get() refers to
                          #       R objects by name rather than value.
                          get(column_name) %in% keyword)
  
  # return to the Global Environment
  return(tmp_df)
}

# end of script #
