[Nu,Set,users] = createMovies('u.data');
for i= 1:100
  N = randi([1,Nu],100,1);  
end
Nlen = length(N);
J = jaccardDistance(Nlen,Set)
S = similarItens(Nlen,J,0.4,N)