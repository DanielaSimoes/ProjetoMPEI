function X = strFinder(str, cellArray)
 result = strfind(str, cellArray);
 
 
  X = 1;
  
   
 if isempty(result)
     X = 0;
 end
