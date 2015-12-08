function X = strFinder(Array, str)
   
  c = cellstr(Array);
  result = strfind(c, str);
  
  X = 1;
  
  if cellfun('isempty',result)
    X = 0;
  end
end