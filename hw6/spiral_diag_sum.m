%{
Write a function called spiral_diag_sum that takes an odd positive integer n as an input
and computes the sum of all the elements in the two diagonals of the n-by-n spiral matrix. 
For example, starting with the number 1 and moving to the right in a clockwise direction, 
a 5-by-5 spiral is formed as follows:
%}

function summ = spiral_diag_sum(n)
X = (1:n^2);
inc = 2;
count = 0;
i = 1;
summ = 1;
while i < length(X)
    i = i + inc;
    summ = summ + X(i);
    count = count + 1;
    if count == 4
        inc = inc + 2;
        count = 0;
    end
end

%{ 
   MORE ELEGANT SOLUTION
   The last element is always n square and it is in the corner.
   A simple arithmetic expression gives the sum of the four corners.
   Do this for a series of odd numbers from 3 to n.
   Add 1 for the starting value in the center

    v = 3:2:n;
    s = 1 + sum(4*v.^2 - 6*(v-1)); 
%}