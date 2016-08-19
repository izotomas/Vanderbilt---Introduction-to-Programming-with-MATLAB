%{
Write a function called centuries that takes a positive integer smaller 
than or equal to 3000 representing a year as its input and returns a string with the century 
the given year falls into. If the input is invalid, the function returns the empty string. 
Centuries are specified using roman numerals. Note that we require the shortest legal roman number. 
For a complete list, refer to: http://www.romannumerals.co/roman-numerals-1-to-30. 
Note that a century goes from year 1 to 100, so for example, 
the XXth century ended on December 31st, 2000. As an example, the call
>> cent = centuries(1864); will make cent equal to ?XIX?.
%}

function s = centuries(n)
s = '';
if length(n(:)) > 1 || n ~= uint16(n) || n > 3000
    return
end
rn = {'I','II','III','IV','V','VI','VII','VIII','IX','X'};
%find cent the beginning
cen = floor(n/100);
if rem(n,100) > 0
    cen = cen + 1;
end
i = 0;
while i < floor(cen/10)
    s = strcat(s,rn{10});
    i = i + 1; 
end
rest = rem(cen,10);
if rest > 0
    s = strcat(s,rn{rest});
end