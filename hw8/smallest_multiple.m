%{
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 
without any remainder. Write a function called smallest_multiple that returns a uint64,
the smallest positive number that is evenly divisible by all of the numbers from 
1 to n where n is a positive integer scalar and is the only input argument of the 
function. If the result would be greater than what can be represented as a uint64, 
the function returns 0. (Inspired by Project Euler.)
%}

function sm = smallest_multiple(n)
rng = cell(1,n);
%% cell with vector of factorized numbers
for i = 1:n
    rng{i} = factor(i);
end
%% find which cell has the biggest occurence of each element
% find unique numbers 
factors = zeros(length(unique([rng{:}])),2);
factors(1:length(unique([rng{:}])),1) = unique([rng{:}]);
factors(1:length(factors),2) = 1;
for j = 1:length(factors)
    maxPow = 1;
    for k = 1:length(rng)
        if length(find(rng{k} == factors(j,1))) > maxPow
            maxPow = length(find(rng{k} == factors(j,1)));
        end
    end
    % add num and pow to cell
    factors(j,2) = maxPow;
end


%% use factors to get result
res = 1;
 for l = 1:length(factors)
     res = uint64(res * factors(l,1)^factors(l,2));
     if res > intmax('uint64') || n >= 47 %couldn't make it work whithout this condition
        sm = uint64(0);
        return
     end
 end
 sm = uint64(res);
end

%% Much more elegant solution using gcd()
%{
function r = smallest_multiple(k) 
    r = uint64(1);
    for n = 1:k
        r = r * (n / gcd(r,n));   % Include factor not already present in r
    end
    if r == intmax('uint64')
       r = uint64(0);
    end
end
%}
