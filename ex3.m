N = 100;

str = cell(N);

for i=1:N
  str{i} = hashstring(40);
end



counter=0;
array = [];
for k=1:15
  % 1 vector para cada k
  BloomFilter = initialize(800);
  for i=1:N
    BloomFilter = insert(BloomFilter, str{i}, k);
  endfor
  % avaliacao de falsos positivos
  for i=1:N
    str2 = hashstring(40);
    tmp = isMember(BloomFilter, str2, k)
    if (tmp==1 && ~strFinder(str, str2))
      counter = counter + 1;
    end
  end
  array = [array, counter/N];
  counter = 0;
end

% para aparecer no mesmo grafico
array1=[];
 for i = 1:15
    array1 = [array1, (1 - exp((-1/8)*i))^i];
 end 
plot(array1,'g'); hold on;plot(array,'r')

%falsePositivesGraph(k);
%subplot(1,2,2)
%plot( array)