function SimilarUsersMinHash = jaccardDistanceMinHash(Nu, k, Set, users)
%funcao para calculo de MinHash com strings
h = waitbar(0,'Calculating');
TotalMins = zeros(Nu,k);

HF = HashFunctionR(1e6);

for i = 1:Nu
    waitbar(i/Nu,h);
    minvector = ones(1,k) * 999999999999;
      for j = 1:length(Set{i})
          str = Set{i}{j}
          for k = 1:1000
            str = [str num2str(k)];
            hash_code = HF.HashCode(str);
            if hash_code < minvector(k)
                minvector(k) = hash_code;
            end
          end
      end
    TotalMins(i,:) = minvector;
end
delete(h)

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

JD

threshold =0.4; % limiar de decisao
% Array para guardar pares similares (user1, user2, distancia)
SimilarUsersMinHash= zeros(1,3);
k= 1;
for n1= 1:Nu,
  for n2= n1+1:Nu,
    if (JD(n1,n2)<0.4)
      SimilarUsersMinHash(k,:)= [double(users(n1)) double(users(n2)) JD(n1,n2)];
      k= k+1;
    end
  end
end
SimilarUsersMinHash
end 

