%{
A palindromic number reads the same both ways. The largest palindrome made from the product of 
two 2-digit numbers is 9009 = 91 × 99. Write a function that is called this way:
>> n = palin_product(dig,lim);
The function returns the largest palindrome smaller than lim that is the product of two dig
digit numbers. If no such number exists, the function returns 0. (Inspired by Project Euler.)
%}

function n = palin_product(dig,lim)
n = 0;
min = 10^(dig-1);
max = 10^dig-1;
for i = min:max
   for j = i:max
     if i*j >= lim 
       break;
     end
     if i*j > n && ispal(i*j)
       n = i*j; 
     end
   end
end

function false = ispal(x)
false = 0;
if int2str(x) == flip(int2str(x))
    false = 1;
end

%{
ALT SOLUTION:
    n = 0;
    a = 10^(dig-1);
    if lim>a^2
        b = 10^dig - 1;
        P = (a:b)' * (a:b);
        P = P(P<lim);
        Q = str2num(fliplr(num2str(P)));
        n = max(P(P==Q));
    end 
%}