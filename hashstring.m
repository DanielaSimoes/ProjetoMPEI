function string=hashstring(N)

a = ['0':'9' 'a':'z' 'A':'Z'];


string = "";
for i=1:N
  tmp =  randi(numel(1:N));
  string = strcat(string, a(1,tmp));
end

end