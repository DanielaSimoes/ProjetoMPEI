function SimilarUsers = jaccardDistanceMinHash(Nu, k, sett, users)

    h= waitbar(0,'Calculating');
    minvector = zeros(Nu,2);
    for n1= 1:Nu
        waitbar(n1/Nu,h);
        min = 900; 
        for i = 1:k,
            tmp1 = hashfunction(sett{n1}, Nu);
            if (tmp1 < min) 
                min = tmp1;
            end
        end
        minvector(n1,:)=[users(n1) min];
    end
    delete (h)
    
    p=1;
    array = zeros(length(users), length(users));
    SimilarUsers = zeros(Nu, 3);
    sizeV = size(minvector)
    for j = 1:sizeV(1),
       for k = j+1:sizeV(1),
          if(minvector(j,2)==minvector(k,2))
              if(array(users(j,1),users(k,1)) == 0 || array(users(j,1),users(k,1)) == 0 )
                SimilarUsers(p,:) = [users(j,1) users(k,1) minCounter(minvector(j,2),minvector)/length(minvector)];
                p = p+1; 
                array(users(j,1),users(k,1)) = 1;
                array(users(k,1),users(j,1)) = 1;
              end
          end
       end
    end
    p
end 


