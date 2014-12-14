if (!require('ggplot2')) { install.packages('ggplot2'); library('ggplot2') }
#### NORMAL DISTRIBUTION ####
sd = 2
exposed = rnorm(1000, sd = sd)
d = with(density(exposed, bw = 'SJ'), data.frame(x, y))
summary(d)
ggplot(mapping = aes(x=x, y=y)) + geom_line(data = d) + scale_y_continuous(limits = c(0, max(d$y))) +
  geom_area(data = subset(d, x < sd & x> -sd), geom_params = list(fill = "red", alpha = 0.5)) +
  geom_area(data = subset(d, x> -1.6*sd & x< -sd), geom_params=list(fill = 'red')) +
  geom_area(data = subset(d, x>sd & x<sd*1.6), geom_params=list(fill = 'red')) +
  geom_area(data = subset(d, x< -1.6*sd), geom_params=list(fill = 'yellow'))
pnorm(1.97, lower.tail = TRUE)

#### DISTRIBUTION OF SAMPLE MEANS ####
population=with(density(sample(rep(1:100), replace = TRUE, size = 500), bw = 'SJ'), data.frame(x,y))
ggplot(data = population, aes(x=x, y=y)) + geom_line()
samples = c()
samples = c(samples,mean(sample(population$x, 50)))
sampleDensity = with(density(samples, bw='SJ'), data.frame(x,y))
qplot(samples, width=0.5, binwidth=1) + geom_vline(x=mean(samples), color='red', alpha=0.5) +
  geom_line(data=sampleDensity, aes(x=x,y=y*length(samples)), color ='red', alpha=0.7)
sd(samples) #standard error
sd(sample(population$x, 50))/sqrt(50) #standard error
