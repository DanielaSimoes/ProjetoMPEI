N = 1000;
BloomFilter = initialize(8000);
k = 15;


str = cell(1,N);

for i=1:N
  str{1,i} = hashstring(40);
end

counter = 0;
for i=1:N
  X = insert(BloomFilter, str{1,i}, k, str);
  str2 = hashstring(40);
  tmp = isMember(X, str2, k);
  if (tmp==1 & ~strFinder(str, str2))
    counter = counter + 1;
  end
end

array = []
for k=1:15
  for i=1:N
    X = insert(BloomFilter, str{1,i}, k, str);
    str2 = hashstring(40);
    tmp = isMember(X, str2, k);
    if (tmp==1 & ~strFinder(str, str2))
      counter = counter + 1;
    end
  end
  array = [array, counter];
end

fprintf('Numero de falsos positivos: %d' , counter)

falsePositivesGraph(k);
subplot(1,2,2)
plot(1:15, array)