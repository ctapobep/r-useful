priorData = sample(c('B', 'C'), 100, replace = TRUE)
priorBProb = 0.5
freq = table(priorData)
nOfB = freq[names(freq) == 'B']
parameter = (priorBProb ^ nOfB) * (1 - priorBProb) ^ (length(priorData) - priorBProb)
x=seq(0, to=1, by=0.01)
sum(x^15 * (1-x)^(35-15)*0.01)
prob = ifelse(x<0.3, 0.3, ifelse(x > 0.7, 0.3, 1))
p = 1
plot(x^p * (1-x)^p ~ x)
