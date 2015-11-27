function [X] = insert(X, str, K, arr)
  
    N = length(X);
    array = [];
    counter = 0;
    
    for i=1:K
      str = [str num2str(i)];
      index = hashfunction(str, N);
      X(index) = 1;
      tmp = isMember(X, str, K);
      if (tmp==1 & ~strFinder(cellstr(arr), str))
         counter = counter + 1;
    
      end
      array = [array, counter];
    end
    
end