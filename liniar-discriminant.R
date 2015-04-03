if(!require('rpart')) {install.packages('rpart'); library('rpart')}
if(!require('entropy')) {install.packages('entropy'); library('entropy')}
if(!require('ggplot2')) {install.packages('ggplot2'); library('ggplot2')}
data('iris')
iris = data.frame(iris)
ggplot(data = iris) +
  geom_point(mapping = aes(x = Petal.Width, y = Sepal.Width, colour = Species))
entropy(table(iris$Species))
printcp(rpart(Species ~ Petal.Width + Sepal.Width, iris))
plotcp(rpart(Species ~ Petal.Width + Sepal.Width, iris))
x=seq(0, 10, .1)
plot(((x^2 - 2*x - 15)/(x - 5))~x, ylim = c(5, 10))
