function [] = FileReader(FileName)
    list = dir('*.txt');
    listing = cell(length(list)-1,1);

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

    X = initialize(1e6);
    fileID = fopen(FileName);
    userBook = textscan(fileID, '%s', 'Delimiter', ' ');
    fclose(fileID);

    counterOfSimilarWords = cell(length(userBook),1);

    counter = 0;
    index = 1;
    for n1 = 1:length(text)
        for n2 = 1:length(text{n1})
            for n3=1:length(text{n1}{n2})
                X = insert(X, char(text{n1}{n2}{n3}),1000);
            end
            for n4 = 1:length(userBook{1})
                if isMember(X,char(userBook{1}(n4)),1000);
                    counter = counter + 1;
                end
            end
            counterOfSimilarWords{index} = counter;
            index = index + 1;
        end
    end

    counterOfSimilarWords
    %fprintf('Existem sensivelmente %d palavras similares.', counterOfSimilarWords);
end