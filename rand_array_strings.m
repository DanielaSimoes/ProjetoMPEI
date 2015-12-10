function [array] = rand_array_strings(k)

array = cell(1,k);
i = 1;
h = waitbar(0,'Calculating');
for r = 1:k
    %gerar um numero aleatorio entre 1 e o primo
    randString = hashstring(10);
    
    %evitar colisões => numero aleatorio unico
    while find(strcmp(randString, array))~=0
      randString = hashstring(10); 
    end
    
    array(1,i)=cellstr(randString);
    i = i + 1;
end
delete(h)