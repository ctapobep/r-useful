# http://www.noamross.net/blog/2014/2/10/using-times-and-dates-in-r---presentation-code.html
# Use as.Date() for dates w/o time
# as.POSIXct() by default for datetime
# as.POSIXlt() when need to extract components
# chron() when need to work with time without TZ
# lubridate is a wrapper around POSIXct, has instants, intervals, durations, and periods
# psych for cicrular statistics e.g. mean
if(!require('assertthat')) install.packages('assertthat')
library('assertthat')

d1 = as.Date('2011-01-01')
d2 = as.Date('2012-01-01')

assert_that(
  d2 - d1 == 365,
  as.integer(difftime(d2, d1, units = 'weeks')) == 52,
  as.integer(difftime(d2, d1, units = 'days')) == 365,
  as.integer(difftime(d2, d1, units = 'days')) == 365)
assert_that(
  are_equal(seq(d1, length = 2, by = 'week'), as.Date(c('2011-01-01', '2011-01-08'))))
assert_that(are_equal(unclass(d1), 14975)) # internal int representation of date

t1 = as.POSIXct('2013-07-24 23:55:26') # ct = calendar time
t1Plus4sec = as.POSIXct('24072013 23:55:30', format = '%d%m%Y %H:%M:%S')
t3 = as.POSIXct('2010-12-01 11:42:03', tz = 'GMT')

assert_that(t1 < t1Plus4sec,
            t1 + 4 == t1Plus4sec,
            noNA(Sys.time()),
            -4 == difftime(t1, t1Plus4sec, 'seconds')
)

t1 = as.POSIXlt("2013-07-24 23:55:26") # lt = local time. Easier to extract components.
unclass(t1)
unlist(t1)
assert_that(
  t1$sec == 26,
  t1$wday == 3,
  trunc(t1, "days") == '2013-07-24',
  trunc(t1, "mins") == '2013-07-24 23:55:00')


