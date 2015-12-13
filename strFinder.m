function X = strFinder(cellArray, str)
   
  result = 0;
  for n1=1:length(cellArray)
      for n2=1:length(cellArray{n1})
        result = strfind(cellArray{n1}{n2},str);
      end
  end
  
  X = 1;
  
  if cellfun(@isempty,result)
    X = 0;
  end
  
end