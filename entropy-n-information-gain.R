if(!require('entropy')) {install.packages('entropy'); library('entropy')}
if(!require('rpart')) {install.packages('rpart'); library('rpart')}
headShape = c('square', 'square', 'square', 'square', 'square', 'circle', 'circle', 'square', 'circle', 'square', 'square', 'square')
bodyShape = c('square', 'square', 'square', 'square', 'square', 'square', 'circle', 'circle', 'circle', 'circle', 'circle', 'circle')
bodyColor = c('white', 'white', 'white', 'white', 'white', 'black', 'black', 'white', 'white', 'white', 'white', 'white')
churn = c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE)
parent = data.frame(headShape, bodyShape, bodyColor, churn)

parentSize = nrow(parent)
parentP = sum(parent$churn == TRUE)/parentSize
parentEntropy = -(parentP * log2(parentP) + (1-parentP)*log2(1-parentP))

entropy(table(parent$churn), unit = 'log2')

getInformationGain = function(colN) {
  informationGain = parentEntropy
  for(level in levels(parent[,colN])) {
    segment = parent[parent[,colN] == level,]
    segmentSize = nrow(segment)
    p = sum(segment$churn == TRUE)/segmentSize
    entropy = -(p * log2(p) + (1-p)*log2(1-p))
    childP = segmentSize/parentSize
    informationGain = informationGain - childP * entropy
  }
  c(parentEntropy, informationGain)
}
getInformationGain(2)

