function InitHashFunction(this)
            % Set prime parameter
            ff = 1000; % fudge factor
            pp = ff * max(this.m + 1,76);
            pp = pp + ~mod(pp,2); % make odd
            while (isprime(pp) == false)
                pp = pp + 2;
            end
            this.p = pp; % sufficiently large prime number
            
            % Randomized parameters
            this.a = randi([1,(pp - 1)]);
            this.b = randi([0,(pp - 1)]);
            this.c = randi([1,(pp - 1)]);
end