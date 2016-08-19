%{
Write a function called peri_sum that computes the sum of the elements of 
an input matrix A that are on the ?perimeter? of A. In other words, 
it adds together the elements that are in the first and last rows and columns. 
Note that the smallest dimension of A is at least 2, but you do not need 
to check this.
%}

function summ = peri_sum(A)
[row, col] = size(A);
summ = innerElementsSum(A,row,col)+firstLastColSum(A,row,col);

function x = innerElementsSum(A,row,col)
x = sum(A(1,2:col-1))+sum(A(row,2:col-1));

function y = firstLastColSum(A,row,col)
y = sum(A(1:row,1))+sum(A(1:row,col));