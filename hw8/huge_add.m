%{
Write function called huge_add that adds together two positive integers of any length specified as 
strings using decimal notation. The single output argument is the result and it is a string as well. 
The inputs and output must contain digits only; no commas, spaces or any other characters are allowed. 
If any of these assumptions are violated by the input, the function returns the number -1.
%}

function ssum = huge_add(a,b)
n1 = str2double(a);
n2 = str2double(b);
if n1 < 0 || n2 < 0 || ~ischar(a) || ~ischar(b)...
        || length(a) ~= length(regexp(a,'\d')) || length(b) ~= length(regexp(b,'\d'))
    ssum = -1;
    return
end
ssum = mySum(a,b);

function arr = mySum(a,b)
arr = [];
if str2double(b) > str2double(a)
    temp = a;
    a = b;
    b = temp;
end
if length(a) > length(b)
    bigLast = length(a);
    smallLast = length(b);
else
    bigLast = length(b);
    smallLast = length(a);
end
overflow = 0;
for i = bigLast:-1:1
    n1 = str2double(a(i));
    if smallLast > 0
        n2 = str2double(b(smallLast));
        res = rem(n1 + n2 + overflow,10);
        smallLast = smallLast - 1;
        arr = [num2str(res),arr];
        if n1 + n2 + overflow > 9
           overflow = 1;
        else
            overflow = 0;
        end
    else
        if overflow > 0
            res = rem(n1 + overflow,10);
            if n1 + overflow > 9
                overflow = 1;
            else
                overflow = 0;
            end
            arr = [num2str(res),arr];
        else
            arr = [num2str(n1),arr];
        end
    end
end
if overflow > 0
    arr = [num2str(overflow),arr];
end

%{
BETTER SOLUTION
function summa = huge_add(a,b)
    if ~ischar(a) || ~ischar(b) || sum(isstrprop(a,'digit')) ~= length(a) || ...
            sum(isstrprop(b,'digit')) ~= length(b)
        summa = -1;
        return;
    end
    lng = max([length(a) length(b)]);
    a = [a(end:-1:1) '0'+zeros(1,lng-length(a))];   % flip and pad with zeros if necessary
    b = [b(end:-1:1) '0'+zeros(1,lng-length(b))];   % flip and pad with zeros if necessary
    carry = 0;
    for ii = 1:lng
        c = carry + str2num(a(ii)) + str2num(b(ii)) % add the digits plus the caryy
        carry = c > 9;                              % is there carry? (0 or 1)
        summa(ii) = num2str(mod(c,10));             % put the character in the result
    end
    if carry
        summa(end+1) = '1';                         % need a leading 1 if carry
    end
    summa = summa(end:-1:1);                        % flip it back
end
%}

