N = 15;
BloomFilter = initialize(15);
k = 3;

str = cell(1,N);

for i=1:N
  str{1,i} = hashstring(40);
  X = insert(BloomFilter, str{1,i}, k);
end

counter = 0
for i=1:N
  str2 = hashstring(40);
  tmp = isMember(X, str2, k);
  if (tmp==1 & ~strFinder(str, str2))
    counter = counter + 1;
  end
end



fprintf('Numero de falsos positivos: %d', counter)