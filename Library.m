list = dir('*.txt');
listing = cell(length(list)-1,1);

index = 1;
for k=1:length(listing)+1
    if strcmp(list(k).name,FileName) == 0
        listing{index} = list(k).name;
    	index = index + 1;
    end
end
    
prompt = 'Qual o seu ID de utilizador? ';
ID = input(prompt);

prompt = 'Qual o t�tulo do livro a requisitar? ';
livro = input(prompt);
livro = [livro '.txt'];

X = initialize(1e6);

for i=1:length(listing)
  X = insert(X, listing{i}, 15);
end

member = isMember(X, livro, 15);

if(member==1)
    fprintf('O seu livro possivelmente existe!\n');
    
    fileID = fopen('books.data', 'a');
    fprintf(fileID,'%d \t %s\n',ID, livro);
    fclose(fileID);
    
    fprintf('Outras sugest�es: ')
    FileReader(livro);
    
else
    fprintf('O seu livro n�o existe!');
end
 
C = textscan(fileID, '%d %s', 'Delimiter', '\t');

fclose(fileID);
t = cellstr(num2str(C{1}));
u = cat(2, t, C{2}); %concatenar users e livros

users = unique(C{1}); % Extrai os IDs dos utilizadores
Nu= length(users); % N de utilizadores

Set= cell(Nu,1); 

for n = 1:Nu, % Para cada utilizador
% Obtem os livros de cada um
    ind = find((int32(str2double(u(:,1)))) == users(n));
% E guarda num array
    Set{n} = [Set{n} u(ind,2)];
end

tic
J=zeros(Nu,1);
h = waitbar(0,'Calculating');
for n1= 1:Nu,
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu,
        J(n1,n2) = 1 - (length(intersect(char(Set{n1}),char(Set{n2})))/length(union(char(Set{n1}),char(Set{n2}))));
    end
end
delete (h)
%save('distance.mat', 'J')
toc

tic
threshold=0.4; %limiar
% Array para guardar pares similares (user1, user2, distancia) 
SimilarUsers=zeros(1,3);
k= 1;
for n1= 1:Nu,
    for n2= n1+1:Nu,
        if (J(n1,n2) < threshold)
          SimilarUsers(k,:)= [double(users(n1)) double(users(n2)) J(n1,n2)];
          k= k+1; 
        end   
    end
end
toc


SimilarUsers

jaccardDistanceMinHash(Nu, 1000, Set, users);
