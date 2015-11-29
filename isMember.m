function y = isMember(X, str, K)
   
  N = length(X);
  
  for i=1:K
    str = [str num2str(i)];
    index = hashfunction(str, N);
    if isSet(X(index))==0
      break;
    endif
  end
  
  if (i==K)
    y= isSet(X(index));
  else
    y=0;
  endif

end