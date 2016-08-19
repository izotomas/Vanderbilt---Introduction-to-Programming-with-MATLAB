%{
Write a function called small_elements that takes as input an array named X 
that is a matrix or a vector. The function identifies those elements of X 
that are smaller than the product of their two indexes. For example, 
if the element X(2,3) is 5, then that element would be identified because 5 
is smaller than 2 * 3. The output of the function gives the indexes of such 
elements found in column-major order. It is a matrix with exactly two columns. 
The first column contains the row indexes, while the second column contains 
the corresponding column indexes. For example, the statement 
indexes = small_elements([1 1; 0 4; 6 5], 
will make indexes equal to [1 2; 2 1; 3 2]. 
If no such element exists, the function returns an empty array.
%}
function small = small_elements(X)
    [r, c] = size(X);
    [x,y] = find(X < ((1:r)' * (1:c)));
    small = [x(:), y(:)];
end
    