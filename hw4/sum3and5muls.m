%{
If we list all the natural numbers up to 10 that are multiples of 3 or 5,
we get 3,5,6,9 and 10.The sum of these multiples is 33. 
Write a function called sum3and5muls that returns the sum of all the 
multiples of 3 or 5 up to n where n is a positive integer and the only 
input argument of the function. (Credit: Project Euler)
%}

function summ = sum3and5muls(n)
summ = sum(unique([3:3:n 5:5:n]));