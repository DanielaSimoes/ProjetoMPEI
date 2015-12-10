udata=load('booksID.data');  % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores 
Nu= length(users); % Numero de utilizadores
% Constroi a lista de filmes para cada utilizador 
Set= cell(Nu,1); % Usa celulas

for n = 1:Nu, % Para cada utilizador
% Obt ÃÅem os filmes de cada um
ind = find(u(:,1) == users(n));
% E guarda num array. Usa celulas porque utilizador tem um n ÃÅumero 
% diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end

prompt = 'ID do livro? ';
s = input(prompt)

X = initialize(Nu*15);

books = cell(Nu,1);
for n = 1:Nu, 
    books{n} = [books{n} u(n,2)];
end

for i=1:length(books)
  X = insert(X, books{i}, 15);
end

member = isMember(X, s, 15);

if(member==1)
    fprintf('O seu livro existe!');
else
    fprintf('O seu livro n„o existe!');
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
J(1,2)
%save('distance.mat', 'J')
toc

tic
threshold=0.4; %limiar de decisao
% Array para guardar pares similares (user1, user2, distancia) 
SimilarUsers= zeros(1,3);
SimilarBooks= zeros(1,1);

k= 1;
t=1;
for n1= 1:Nu,
    for n2= n1+1:Nu,
        if (J(n1,n2) < threshold)
          SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)];
          k= k+1; 
          %if books{n1}==s
          %    SimilarBooks(t,:) = books{n1};
          %    t = t + 1;
          %end
          %talvez n„o faÁa sentido porque sÛ se obtem os iguais
        end   
    end
end
toc
fprintf('Users similares: ');
SimilarUsers


fprintf('Livros similares pelo MinHash: ');
jaccardDistanceMinHash(Nu, 1000, Set, users);