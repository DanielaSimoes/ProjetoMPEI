N = 10;
BloomFilter = initialize(80);
k = 3;


Ola = initialize(20);
x = insert(Ola, 'Daniela', 2);
X
isMember(X, 'Daniela' ,2);


str = cell(1,N);

for i=1:N
  str{1,i} = hashstring(40);
   insert(BloomFilter, str{1,i}, k);
end

for i=1:N
 % insert(BloomFilter, str{1,i}, k);
end


for i=1:N
  str2 = hashstring(40);
  tmp = isMember(BloomFilter, str2, k);
  if (tmp==1 & ~strFinder(str, str2))
    counter = counter + 1;
  end
end




%fprintf('Numero de falsos positivos: ', counter)