function Set = createMovies(nomeFicheiro)

udata=load(nomeFicheiro);  % Carrega o ficheiro dos dados dos filmes
% Fica apenas com as duas primeiras colunas
u= udata(1:end,1:2); clear udata;

% Lista de utilizadores
users = unique(u(:,1)); % Extrai os IDs dos utilizadores 
Nu= length(users); % N ́umero de utilizadores

% Constr ́oi a lista de filmes para cada utilizador 
Set= cell(Nu,1); % Usa c ́elulas

for n = 1:Nu, % Para cada utilizador
% Obt ́em os filmes de cada um
    ind = find(u(:,1) == users(n));
% E guarda num array. Usa c ́elulas porque utilizador tem um n ́umero 
% diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end