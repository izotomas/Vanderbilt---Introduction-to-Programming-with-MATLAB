%{
Write a function called day_diff that takes four scalar positive integer inputs, 
month1, day1, month2, day2. These represents the birthdays of two children who were born 
in 2015. The function returns a positive integer scalar that is equal to the difference 
between the ages of the two children in days. Make sure to check that the input values 
are of the correct types and they represent valid dates. If they are erroneous, return -1. 
An example call to the function would be
>> dd = day_diff(1,30,2,1);
which would make dd equal 2. You are not allowed to use the built-in function datenum 
or datetime.
%}

function diff = day_diff(month1, day1, month2, day2)
if validDate(month1,day1) && validDate(month2,day2)
    diff = abs(convertToDays(month1,day1) - convertToDays(month2,day2));
else
    diff = -1;
end
end


function val = validDate(m, d)
if  ~isscalar(m) || ~isscalar(d) || m < 1 || d < 1 ...
    || m ~= fix(m) || d ~= fix(d)
    val = 0;
else
    switch m
    case {1,3,5,7,8,10,12}
        val = d <= 31;
    case 2
        val = d <=28;
    case {4,6,9,11}
        val = d <=30;
    end
end
end

function days = convertToDays(month, day)
year = [31 28 31 30 31 30 31 31 30 31 30 31];
days = sum(year(1:month-1)) + day;
end