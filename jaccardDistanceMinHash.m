function SimilarUsers = jaccardDistanceMinHash(Nu, k, Set, users)

coefA = coef_a_b(k);
coefB = coef_a_b(k);

c = 1693;

minvectors = zeros(Nu,k);
h = waitbar(0,'Calculating');

for i = 1:Nu
    waitbar(i/Nu,h);
    minvector = zeros(1,k);
    for k = 1:100
    min = 2000;
        for j = 1:length(Set{i})
            tmp1 = mod(coefA(k) * Set{i}(j) + coefB(k),c);
            if tmp1 < min
                min = tmp1;
            end
        end
    minvector(1,k) = min;
    end
    delete(h)
    minvectors(i,:) = minvector;
end

JDist=zeros(Nu);
for n1 = 1:Nu % Get the MinHash signature for document i.
  tmp2 = minvectors(n1,:);  
  for n2= n1+1:Nu %For each of the other test documents...
    tmp3 = minvectors(n2,:); % Get the MinHash signature for document j
    count = 0; %Count the number of positions in the minhash signature which are equal
    for k = 1:100
      count = count + (tmp2(k) == tmp3(k)); % Record the percentage of positions which matched.    
    end
     JDist(n1,n2) = 1-(count / k);
  end
end

threshold =0.4;  % limiar de decisao
% Array para guardar pares similares (user1, user2, distancia)
similarItens(Nu,JDist,threshold,users);

end 