%{
*** Write a function called exp_average that computes the ?exponentially weighted 
moving average,? or ?exponential average? for short, of a sequence of scalars. 
The input sequence is provided to the function one element at a time and the function 
returns the current average each time. If we denote the nth element of the input 
sequence, that is, the function input at the nth invocation, by inn, then the rule 
for calculating the corresponding average outn that is to be returned by the function 
is:
out1 = in1
outn =b?inn +(1-b)?outn-1
where b is a coefficient between 0 and 1. You do not need to check b. 
In plain English, the current average depends on the current input and 
the previously computed average weighted by b and (1 - b), respectively. 
Here is how the function is expected to work. When called by two input arguments, 
the input sequence is reset, the first input argument is considered to be in1 and 
the second input argument is the value of the coefficient b. When called with a 
single input argument, it is considered to be int, that is, the current value of 
the input sequence. In both cases, the output is calculated according to the formula 
above. If the function is called for the very first time with a single input 
argument, the value of the coefficient b must default to 0.1.
%}

function avg = exp_average(n,b)
persistent average;
persistent coef;
if nargin < 2
    if isempty(average)
        coef = 0.1;
        average = n;
    else
        average = coef*n+(1-coef)*average;
    end
else
    coef = b;
    average = n;
    average = coef*n+(1-coef)*average;
end
avg = average;
end

    