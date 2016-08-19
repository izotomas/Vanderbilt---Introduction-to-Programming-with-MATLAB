%{
Write a function called year2016 that returns a row-vector of struct-s whose elements correspond 
to the days of a month in 2016 as specified by the input argument. If the input is not an integer 
between 1 and 12, the function returns the empty array. Each struct should contain three fields 
with these (exact) field names: ?month?, ?date?, and ?day? (all lower case).
? The month field must contain a string with the name of the month (first letter capitalized).
? The date field must contain a scalar specifying the day of the month.
? The day field must contain the three-letter abbreviation of the day chosen from this list:
'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'.
For example, here is a call of the function followed by a command that shows the seventh element of the struct array that is returned by the function:
      >> m = year2016(2);
>> m(7)
ans =month: 'February' date: 7
day: 'Sun'
%}

function s = year2016(n)
s = [];
if length(n) > 1 || n ~= int8(n) || n < 1 || n > 12
   return;
end
for i = 1:eomday(2016,n)
    s(i).month = char(month(datetime(2016,n,1),'name'));
    s(i).date = i;
    [~, d] = weekday(datetime(2016,n,i));
    s(i).day = d;
end
end