function [SimilarUsersMinHash, JD] = jaccardDistanceMinHash(Nu, k, Set, users)
%funcao para calculo de MinHash com strings
h = waitbar(0,'Calculating');
TotalMins = [];

FirstRand = rand_array(k);
SecondRand = rand_array(k);
prime = 1000000005713;

HF = HashFunctionR(1e6);

%gera os minimos atraves da hashfunction e guarda o menor dos minimos
for i = 1:Nu
    waitbar(i/Nu,h);
    minvector = zeros(1,k);
    for k = 1:1000
        min = 20000000;
        for j = 1:length(Set{i})
            str = HF.HashCode(Set{i}{j});
            hash_code = mod(mod(FirstRand(k)*str+ SecondRand(k),prime), 1000000005721);
            if hash_code < min
                min = hash_code;
            end
        end
        minvector(1,k) = min;
    end
    TotalMins(i,:) = minvector;
end
delete(h)

%conta os minimos iguais e divide por k
JD=zeros(Nu);
for n1 = 1:Nu
  mins1 = TotalMins(n1,:);
  for n2= n1+1:Nu
    mins2 = TotalMins(n2,:);
    
    count = sum(mins1 == mins2);
    JD(n1,n2) = 1 - (count / k);
     
  end
end
threshold =0.4; % limiar de decisao
% Array para guardar pares similares (user1, user2, distancia)
SimilarUsersMinHash= zeros(1,3);
k= 1;
for n1= 1:Nu,
  for n2= n1+1:Nu,
    if (JD(n1,n2)<0.4)
      SimilarUsersMinHash(k,:)= [(users(n1)) (users(n2)) JD(n1,n2)];
      k= k+1;
    end
  end
end
%SimilarUsersMinHash
end 

