function X = hashfunction(str, tablesize)

    len=length(str);
    hash=1;
    c=1;
    for i=1:len
       c=str(i)+33;
       hash=((bitshift(hash,3))+(bitshift(hash,-28))+c);
    end
    X=rem(hash,tablesize-1)+1;
end
