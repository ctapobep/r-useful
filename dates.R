if(!require('assertthat')) install.packages('assertthat')
library('assertthat')

d1 = as.Date('2011-01-01')
d2 = as.Date('2012-01-01')

assert_that(
  d2 - d1 == 365,
  are_equal(as.integer(difftime(d2, d1, units = 'weeks')), 51),
  are_equal(as.integer(difftime(d2, d1, units = 'days')), 365),
  are_equal(as.integer(difftime(d2, d1, units = 'days')), 365))

assert_that(
  are_equal(seq(d1, length = 2, by = "week"), as.Date(c('2011-01-01', '2011-01-08'))))

