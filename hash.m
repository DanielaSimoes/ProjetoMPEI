function h = hash(s, len, seed)

h=seed;
for i= 1:len    
h=31*h+s(i);
end