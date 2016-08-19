%{
Write a function called odd_rms that returns orms, 
which is the square root of the mean of the squares of the 
first nn positive odd integers, where nn is a positive integer 
and is the only input argument. For example, if nn is 3, your 
function needs to compute and return the square root of the average 
of the numbers 1, 9, and 25. You may use built-in functions including, 
for example, sum and sqrt, except for the built-in function rms, 
which is not allowed.
%}

function orms = odd_rms(n)
orms = sqrt(mean((1:2:(n*2)).^2));