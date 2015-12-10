X = initialize(15);

Cidades = {'Aveiro';'Agueda'};

for i=1:length(Cidades)
  X = insert(X, Cidades{i}, 3);
end

isMember(X,'Agueda', 3)
isMember(X,'Oronhe', 3)
isMember(X,'Aveiro', 3)