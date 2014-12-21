if (!require('ggplot2')) { install.packages('ggplot2'); library('ggplot2') }
#### NORMAL DISTRIBUTION ####
sd = 10
mean = 170
exposed = rnorm(1000, sd = sd, mean = mean)
d = with(density(exposed, bw = 'SJ'), data.frame(x, y))
summary(d)
sdBreaks = mean+sd*seq(-2, 2)
breakLabels = paste(sdBreaks, c('(-2\U03C3)', '(-\U03C3)', '', '(\U03C3)', '(2\U03C3)'))
ggplot(mapping = aes(x=x, y=y)) + geom_line(data = d) +
  scale_y_continuous(limits = c(0, max(d$y))) +
  scale_x_continuous(breaks = sdBreaks, labels = breakLabels) +
  geom_vline(color = 'red', x = mean) +
  geom_area(data = subset(d, x < mean + sd & x> mean - sd), fill = 'steelblue', alpha = 0.5) +
  geom_text(aes(label=c('34%', '34%')), x = mean + c(sd/2, -sd/2), y = 0.005, angle=90) +

  geom_area(data = subset(d, x> mean-2*sd & x< mean-sd), fill = 'steelblue', alpha=0.7) +
  geom_area(data = subset(d, x>mean+sd & x<mean+sd*2), fill = 'steelblue', alpha=0.7) +
  geom_text(aes(label=c('13.5%', '13.5%')), x = mean + c(1.5*sd, -1.5*sd), y = 0.005, angle=90) +

  geom_area(data = subset(d, x < mean-2*sd),fill = 'steelblue')
pnorm(1.97, lower.tail = TRUE)
