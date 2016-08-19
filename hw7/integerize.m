%{
Write a function called integerize that takes as its input a matrix A of integers 
of type double, and returns the name of the ?smallest? signed integer class to 
which A can be converted without loss of information. If no such class exists, 
the string 'NONE' is returned. For example, if the element of A with the largest 
absolute value is 120, then the function would return 'int8'. As another example, 
if there is an element of A equal to -1e20, then the function would return 'NONE'.
%}


function s = integerize(A)
B=A(:);
s = 'NONE';
n = 64;
while n >= 8
    if isequal(B,B(find(B >= intmin(sprintf('int%d',n)) & B <= intmax(sprintf('int%d',n)))))
        s = sprintf('int%d',n);
    end
    n = n/2;
end
