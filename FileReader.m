%function [] = FileReader(FileName)
    list = dir('*.txt');
    listing = cell(length(list)-1,1);
    FileName = 'Livro 2.txt';

    index = 1;
    for k=1:length(listing)+1
        if strcmp(list(k).name,FileName) == 0
            listing{index} = list(k).name;
            index = index + 1;
        end
    end

    text = cell(1,length(listing));

    for i=1:length(listing)
        fileID = fopen(listing{i});
        text{i} = textscan(fileID, '%s', 'Delimiter', ' ');
        fclose(fileID);
    end
    
    n = 0;
    % n - number of items to add
    for n1 = 1:length(text)
        for n2 = 1:length(text{n1})
            for n3 = 1:length(text{n1}{n2})
                n = n + 1;
            end
        end
    end
  
    p = 1e-6;
    m = ceil((n * log(p)) / log(1.0 / 2^log(2.0)));
    x = round(log(2.0) * m / n);
    
    X = initialize(1e6);
    
    fileID = fopen(FileName);
    userBook = textscan(fileID, '%s', 'Delimiter', ' ');
    fclose(fileID);
    counterOfSimilarWords = cell(length(userBook),1);

    counter = 0;
    index = 1;
    h = waitbar(0,'Calculating');
    for n1 = 1:length(text)
        waitbar(n1/length(text),h);
        for n2 = 1:length(text{n1})
            for n3=1:length(text{n1}{n2})
                X = insert(X, char(text{n1}{n2}{n3}),x);
            end
            for n4 = 1:length(userBook{1})
                if isMember(X,char(userBook{1}(n4)),x);
                    counter = counter + 1;
                end
            end
            counterOfSimilarWords{index} = counter;
            index = index + 1;
        end
    end
    delete (h)
    
    %verificar livros similares. Considera-se similar se tiverem pelo menos
    %metade das palavras iguais
    %for n1= 1:length(listing)
        limiar = cell2mat(counterOfSimilarWords)/length(userBook{1});
        if limiar >= 0.5
            fprintf('%s \n',char(listing{n1}));
        end
    %end
    
    h = waitbar(0,'Calculating');
   %Gráfico de falsos positivos
    counter=0;
    words = 0;
    array = [];
   
    for k=1:x
      % 1 vector para cada k
      waitbar(k/x,h);
      BloomFilter = initialize(8000);
      for n3=1:1000
                setStrings{n3} = hashstring(40);
                BloomFilter = insert(BloomFilter, setStrings{n3}, k);
      end
      
      % avaliacao de falsos positivos
       for n3=1:1000
                str2 = hashstring(40);
                tmp = isMember(BloomFilter, str2, k);
                words = words + 1;
                if (tmp==1 && ~strFinder(str2, setStrings{n3}))
                    counter = counter + 1;
                end
        end
            array = [array, counter/words];
            counter = 0;
            words=0;
    end
    delete(h)

% para aparecer no mesmo grafico
 array1=[];
 for i = 1:x
    array1 = [array1, (1 - exp((-1/8)*i))^i];
 end 
plot(array1,'g'); hold on;plot(array,'r')


    
%end