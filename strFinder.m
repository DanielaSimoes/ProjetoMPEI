function X = strFinder(cellArray, str)
   cellArray{1}{1}
  result = 0;
  for n1=1:length(cellArray)
      for n2=1:length(cellArray)
        result = strmatch(str, cellArray{n1}{n2});
      end
  end
  
  X = 1;
  
  if result==0
    X = 0;
  end
end