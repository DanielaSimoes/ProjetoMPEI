function P = isMember(X, str, K)
   
  N = length(X);
  
  for i=1:K
    str = [str num2str(i)];
    index(i) = hashfunction(str, N);
  end
  
P = (all(X(index))==1);

end