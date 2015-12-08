fileID = fopen('books.data');
C = textscan(fileID, '%s %d', 'Delimiter', ' ');

fclose(fileID);
t = cellstr(num2str(C{2}))
u = cat(2, C{1}, t)

users = C{2} % Extrai os IDs dos utilizadores
Nu= length(C{2}); % N de utilizadores

Set= cell(Nu,1); 

for n = 1:Nu, % Para cada utilizador
% Obtem os livros de cada um
    ind = find(int32(str2double(u(:,2))) == users(n))
% E guarda num array
    Set{n} = [Set{n} u(ind,2)];
end

tic
J=zeros(Nu,1);
h = waitbar(0,'Calculating');
for n1= 1:Nu,
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu,
      J(n1,n2) = 1 - (length(intersect(Set{n1},Set{n2}))/length(union(Set{n1},Set{n2})));
    end
end
delete (h)

save('distance.mat', 'J')

toc

tic
threshold=0.4; %limiar
% Array para guardar pares similares (user1, user2, distancia) 
SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu,
    for n2= n1+1:Nu,
        if (J(n1,n2) < threshold)
          SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
          k= k+1; 
        end   
    end
end
toc

SimilarUsers

jaccardDistanceMinHash(Nu, 1000, Set, users);
