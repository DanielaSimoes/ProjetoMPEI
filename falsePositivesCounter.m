function p = falsePositivesCounter(X, str, K)
  
p = all(X(index))==1 & strFinder(str)