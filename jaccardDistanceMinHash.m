function SimilarUsersMinHash = jaccardDistanceMinHash(Nu, k, Set, users)

    FirstRand = rand_array(k);
    SecondRand = rand_array(k);

prime = 1693;

TotalMins = zeros(Nu,k);
for i = 1:Nu
    minvector = zeros(1,k);
    for k = 1:1000
        min = 2000;
        for j = 1:length(Set{i})
            hash_code = mod(mod(FirstRand(k)*Set{i}(j)+ SecondRand(k), prime), 1021);
            %hash_code = hashfunction(num2str(Set{i}(j)), 3000);
            
            if hash_code < min
                min = hash_code;
            end
        end
    minvector(1,k) = min;
    end
    TotalMins(i,:) = minvector;
end

JD=zeros(Nu);
for n1 = 1:Nu
  mins1 = TotalMins(n1,:);
  for n2= n1+1:Nu
    mins2 = TotalMins(n2,:);
    
    count = 0;
    
    for k = 1:1000
      count = count + (mins1(k) == mins2(k));  
    end
     JD(n1,n2) = 1-(count / k);
  end
end

threshold =0.4; % limiar de decisao
% Array para guardar pares similares (user1, user2, distancia)
SimilarUsersMinHash= zeros(1,3);
k= 1;
for n1= 1:Nu,
  for n2= n1+1:Nu,
    if (JD(n1,n2)<0.4)
      SimilarUsersMinHash(k,:)= [users(n1) users(n2) JD(n1,n2)];
      k= k+1;
    end
  end
end
SimilarUsersMinHash
end 


