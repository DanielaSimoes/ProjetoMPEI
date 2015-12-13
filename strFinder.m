
function X = strFinder(cellArray, str)
  
   result = 0;
   result = strmatch(char(str), char(cellArray), 'exact');
    X = 1;
  
  if isempty((result))
    X = 0;
  end
  
end