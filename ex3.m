N = 10;
BloomFilter = initialize(80);
k = 3;

str = cell(N,1)

for i=1:N
  str{i,1} = {hashstring(40)};
  insert(BloomFilter, str, k);
end

for i=1:N
  str2 = hashstring(40);
  tmp = isMember(BloomFilter, str2, k);
  if (tmp==1 & ~strFinder(str, str2))
    counter += 1;
  end
end

fprintf("Numero de falsos positivos: ", counter)