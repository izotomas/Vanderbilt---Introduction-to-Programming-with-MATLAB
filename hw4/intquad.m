%{
Write a function called intquad that takes as its input arguments 
two scalar positive integers named n and m in that order. 
The function returns Q, a 2n-by-2m matrix. Q consists of four n-by-m 
submatrices. The elements of the submatrix in the top left corner are all 0s, 
the elements of the submatrix at the top right are 1s, the elements 
in the bottom left are 2s, and the elements in the bottom right are 3s.
%}

function Q = intquad(n,m)
Q = [zeros(n,m) ones(n,m); 2*ones(n,m) 3*ones(n,m)];
