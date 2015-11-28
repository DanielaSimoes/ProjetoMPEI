function [X] = insert(X, str, K)

    N = length(X);
    for i=1:K
      str = [str num2str(i)];
      index = hashfunction(str, N);
      X(index) = 1;
    end
    
end