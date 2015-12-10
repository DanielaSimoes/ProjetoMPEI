function [array] = rand_array(k)

prime=1682;
%nextPrime = 1693;

array = zeros(1,k);
  
for r = k:-1:1
    %gerar um numero aleatorio entre 1 e o primo
    randNumber = randi([1 prime], 1, 1);
    
    %evitar colisões => numero aleatorio unico
    while isempty(find(array==randNumber, 1))==0
      randNumber = randi([1 prime], 1, 1);
    
    end
    array(1,r)=randNumber;
end