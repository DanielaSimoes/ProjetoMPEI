function p = falsePositivesCounter(X, str)
  
  
p = all(X(index))==1 & strFinder(str)