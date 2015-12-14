function X = strFinder(str, cellArray)
 %ver se a string existe no cell array
 result = strfind(str, cellArray);
  X = 1;
  
 %se nao existir retorna 0
 if isempty(result)
     X = 0;
 end
