%{
Write a function max_product that takes v a vector and n, a positive integer, 
as inputs and computes the largest product of n consecutive elements of v. 
It returns the product and the index of the element of v that is the first term of 
the product. If there are multiple such products in v, the function must return 
the one with the smallest starting index. As an example, the following call
>> [product, ind] = max_product([1 2 2 1 3 1],3);
will assign 6 to product and 3 to ind since the max 3-term product in the input 
vector is 2*1*3.
If v has fewer than n elements, the function returns 0 and -1, respectively.
%}

function [product, ind] = max_product(v,n)
if length(v) < n
    product = 0;
    ind = -1;
else
    product = [];
    ind = 0;
    for i = 1:length(v)-n+1
        pr = v(i);
        for j = 1:n-1
            pr = pr * v(i+j);
        end
        if  isempty(product) || pr > product
            product = pr;
            ind = i;
        end
    end
end
