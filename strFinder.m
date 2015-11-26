function X = strFinder(Array, str)

  result = strfind(Array, str)
  
  X = 1;
  
  if isempty(result{:,:})
    X = 0
  end
end