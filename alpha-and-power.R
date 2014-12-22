if (!require('ggplot2')) { install.packages('ggplot2'); library('ggplot2') }
sd = 10
mean = 170
alpha = 0.05
power = 0.8

h0leftTail = qnorm(alpha/2, sd = sd, mean = 170)
h0rightTail = qnorm(1-alpha/2, sd = sd, mean = 170)

h1Mean = h0rightTail + qnorm(0.5, mean = mean, sd = sd) - qnorm(1-power, mean = mean, sd = sd)

dH0 = with(density(rnorm(1000, sd = sd, mean = mean)), data.frame(x, y))
dH1 = with(density(rnorm(1000, sd = sd, mean = h1Mean)), data.frame(x, y))

ggplot(mapping = aes(x=x, y=y)) + geom_line(data = dH0) +
  scale_y_continuous(limits = c(0, max(c(dH0$y, dH1$y)))) +
  geom_area(data = subset(dH0, x < h0leftTail),fill = 'steelblue') +
  geom_area(data = subset(dH0, x > h0rightTail),fill = 'steelblue') +
  geom_line(data = dH1) + geom_vline(x = h1Mean, color = 'red') +
  geom_area(data = subset(dH1, x > qnorm(1-power, mean = h1Mean, sd = sd)), fill = 'steelblue', alpha=0.5)
