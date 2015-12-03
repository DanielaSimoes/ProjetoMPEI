function minCounter = minCounter(n, minvector)

sizeV = size(minvector);
minCounter = 1;
minimos = minvector(:,2);
for i=1:sizeV(1),
    if(minimos(i)==n)
        minCounter = minCounter+1;
    end
end

end