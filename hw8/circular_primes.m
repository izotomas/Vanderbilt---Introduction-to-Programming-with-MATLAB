%{
Write a function called circular_primes that finds the number of circular prime numbers 
smaller than n, where n is a positive integer scalar input argument. For example, the 
number, 197, is a circular prime because all rotations of its digits: 197, 971, and 719, 
are themselves prime. For instance, there are thirteen such primes below 100: 
2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97. It is important to emphasize that 
rotation means circular permutation not all possible permutations.
%}

function n = circular_primes(max)
pn = primes(max-1);
n = length(pn);
%filter out non circular primes
for i = 1:length(pn)
    arr = num2str(pn(i));
    for j = 1:length(arr) 
        arr = circshift(arr,[2,1]);
        k = str2double(arr);
       if ~isprime(k)
           n = n - 1;
           break;
       end
    end
end
