%{
Write the function find_zero that is defined like this function x = find_zero(f,x1,x2).
The first input argument is special. It is a ?function handle?. A function handle is gotten by 
typing @ and the name of any function. For example, x = find_zero(@sin,-1,1) will give f the
function handle for MATLAB?s built-in sin function. Then, inside find_zero, the statement
y = f(-1) would set y = sin(-1). Note that the @ sign is not used inside the function. Only the
caller uses it. All other arguments to find_zero are scalar numbers, and x1 is less than x2. 
The goal of the function is to find an x that lies in the range from x1 to x2 such that after 
the command, y = f(x), is executed inside the function find_zero, y is approximately zero as 
defined by abs(y) < 1e-10. All you know about the function f is that it has one scalar input and 
one scalar output, and a plot of its values crosses the x-axis exactly once between x1 and x2, as, 
for example, in the figure. It is the responsibility of the caller to call the function with 
arguments that obey these rules. Here are two sample runs:

 >> find_zero(@sin,-2.5,2.3)        % as shown in the figure
        ans =-6.4000e-11
>> find_zero(@cos,-2,1.3) ans =
        -1.5708

Note that you are not allowed to use the built-in function fzero. 
Hint: you may want to check the value of the function halfway between x1 and x2 
and decide what to do next based on that.
%}

function x = find_zero(f,x1,x2)
i = 5;
range = x1:10^-i:x2;
%plot(range,f(range));
%hold on;
while min(abs(f(range))) > 1e-10
    [~, x_index] = min(abs(f(range)));
    x1 = range(x_index - 1);
    x2 = range(x_index + 1);
    i = i + 1;
    range = x1:10^-i:x2;
end
[~, minIndex] = min(abs(f(range)));
x = range(minIndex);
%plot(range(y),x,'ro');
