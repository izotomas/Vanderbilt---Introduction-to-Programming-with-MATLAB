%{
Write a function called top_right that takes two inputs: a matrix N and a
scalar non-negative integer n, in that order, where each dimension of N is
greater than or equal to n. The function returns the n-by-n square array at 
the top right corner of N.
%}

function M = top_right(N,n)
[~, col] = size(N);
M = N(1:n,(1+col-n):col);

