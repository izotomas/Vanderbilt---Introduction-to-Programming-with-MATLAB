%{
Write a function called approximate_e that compute e, Euler?s number.
Instead of going to infinity, the function stops at the smallest k for which 
the approximation differs from exp(1) (i.e., the value returned MATLAB?s built-in 
function) by no more than the positive scalar, delta, which is the only input argument.
The first output of the function is the approximate value of e, while the second is k. 
(Note: if your program or the grader takes a long time, you may have created an 
infinite loop and need to hit Ctrl-C on your keyboard.) You are not allowed to use 
the built-in function factorial.
%}

function [e, k] = approximate_e(delta)
e = 0;
ord = 0;
fk = 0;
while exp(1) - e > delta
    [fk, ord] = my_factorial(fk,ord);
    e = e + 1/fk;
    k = ord - 1;
end
function [num, seq] = my_factorial(nBefore,order)
if order == 0
    num = 1;
else
    num = nBefore*(order);
end
seq = order + 1;
