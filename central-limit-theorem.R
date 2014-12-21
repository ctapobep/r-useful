if (!require('ggplot2')) { install.packages('ggplot2'); library('ggplot2') }
#### NORMAL DISTRIBUTION ####

population=with(density(sample(rep(1:100), replace = TRUE, size = 500), bw = 'SJ'), data.frame(x,y))
ggplot(data = population, aes(x=x, y=y)) + geom_line()
samples = c()
samples = c(samples,mean(sample(population$x, 50)))
sampleDensity = with(density(samples, bw='SJ'), data.frame(x,y))
qplot(samples, width=0.5, binwidth=1) + geom_vline(x=mean(samples), color='red', alpha=0.5) +
  geom_line(data=sampleDensity, aes(x=x,y=y*length(samples)), color ='red', alpha=0.7)
sd(samples) #standard error
sd(sample(population$x, 50))/sqrt(50) #standard error
