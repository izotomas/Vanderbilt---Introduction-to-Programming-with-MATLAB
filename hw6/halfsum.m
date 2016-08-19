%{
Write a function called halfsum that takes as input an at most two-dimensional array 
A and computes the sum of the elements of A that are in the lower right triangular 
part of A, that is, elements in the counter-diagonal (going from the bottom left 
corner, up and to the right) and elements that are to the right of it. 
For example, if the input is [1 2 3; 4 5 6; 7 8 9], then the function would return 38.
%}

function hsum = halfsum(A)
[r, c] = size(A);
hsum = 0;
for i = 1:r
   for j = c:-1:r+1-i
       hsum = hsum + A(i,j);
   end
end
%  more elegant solution
%  hsum = sum(sum(triu(flipud(A))))