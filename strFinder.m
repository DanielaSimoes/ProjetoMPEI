function X = strFinder(Array, str)

  result = strfind(cellstr(Array), str)
  
  X = 1;
  
  if isempty(cellstr(result))
    X = 0
  end
end