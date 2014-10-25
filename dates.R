if(!require('assertthat')) install.packages('assertthat')
library('assertthat')

d1 = as.Date('2011-01-01')
d2 = as.Date('2012-01-01')

assert_that(
  d2 - d1 == 365,
  are_equal(as.integer(difftime(d2, d1, units = 'weeks')), 52),
  are_equal(as.integer(difftime(d2, d1, units = 'days')), 365),
  are_equal(as.integer(difftime(d2, d1, units = 'days')), 365))
