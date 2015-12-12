function X = strFinder(str, cellArray)
  result = 0;
  for n1=1:length(cellArray)
      for n2=1:length(cellArray)
        result = strmatch(char(str), char(cellArray), 'exact');
      end
  end
  delete(h)
  X = 1;
  
  if result==0
    X = 0;
  end
end