fileID = fopen('test1.txt');
text1 = textscan(fileID, '%s', 'Delimiter', ' ');
fclose(fileID);

fileID = fopen('test2.txt');
text2 = textscan(fileID, '%s', 'Delimiter', ' ');
fclose(fileID);
X = initialize(1e6);

for n1 = 1:length(text2{1})
       BloomFilter = insert(X, char(text2{1}(n1)),1000);
end

counterOfSimilarWords = 0;
for n1 = 1:length(text1{1})
       if isMember(BloomFilter,char(text1{1}(n1)),1000);
           counterOfSimilarWords = counterOfSimilarWords + 1;
       end
end

fprintf('Existem sensivelmente %d palavras similares.', counterOfSimilarWords);