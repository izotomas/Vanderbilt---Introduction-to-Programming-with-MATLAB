%{
Write a function called sindeg that takes a matrix input called deg. 
The function returns a matrix of the same size as deg with each of 
its elements containing the sine of the corresponding element of deg. 
Note that the elements of deg are given in degrees and not radians. 
As a second output, the function returns a scalar that contains the 
average value of the first output. You are not allowed to use the sind 
and cosd built-in functions, but the use of any other function is acceptable.
%}

function [M, avg] = sindeg(deg)
M = sin(degtorad(deg));
[a,b] = size(M);
avg = sum(M(:))/(a*b);
