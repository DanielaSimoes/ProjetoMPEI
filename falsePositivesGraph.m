function f = falsePositivesGraph(k)

array = []

  for i = 1:k
    array = [array, (1 - exp((-1/8)*i))^i];
  end 
  
  plot(1:15, array)
  axis("tight")
  ylabel("Falsos positivos prob.")
  xlabel("Número de hash functions, k")
end

