if (!require('ggplot2')) { install.packages('ggplot2'); library('ggplot2') }
# When we take samples from population and calculate the mean - this mean imperfectly describes
# the population mean. Hence, when presenting the numbers, we cannot tell a single number -
# we should mention the range of possible values. Cenral limit theorem helps with this.
population=with(density(sample(rep(1000:5000), replace = TRUE, size = 500), bw = 'SJ'), data.frame(x,y))
ggplot(data = population, aes(x=x, y=y)) + geom_line() +
  geom_vline(x = mean(population$x), color = 'red')
samples = c()

samples = c(samples, mean(sample(population$x, 50)))
sampleDensity = with(density(samples, bw='SJ'), data.frame(x,y))
qplot(samples, width=0.5, binwidth=1) + geom_vline(x=mean(samples), color='red', alpha=0.5) +
  scale_y_continuous(limits = c(0, max(sampleDensity$y)*length(samples))) +
  geom_vline(x=mean(population$x), color = 'red', linetype=1, size=1) +
  geom_vline(x=tail(samples, 1)) +
  geom_line(data=sampleDensity, aes(x=x,y=y*length(samples)), color ='steelblue', alpha=0.7)

sd(samples) #standard error
sd(sample(population$x, 50))/sqrt(50) #standard error

