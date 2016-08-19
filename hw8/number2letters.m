%{
If the numbers 1 to 5 are written out in words: one, two, three,four,five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
Write a function called number2letters that returns the number of letters needed to write
down the number n in words. For example, 342 (three hundred forty two) contains 20
letters. Notice that we do not count spaces, nor do we use hyphens. The only input to
the function is n, a positive integer smaller than 1000, but you do not need to check
this. (Inspired by Project Euler.)
%}

function sl = number2letters(n)
sl = 0;
simpl = {'one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen'};
high = {'','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety'};


%% check hudnreds
if floor(n/100) > 0
   sl = length(simpl{floor(n/100)}) + length('hundred');
   n = rem(n,100);
end
%% Check for numbers 0-19 and 20 - 99 then
if n == 0
    if sl == 0
        sl = 4;
    end
    return
elseif n < 20
    sl = sl + length(simpl{n});
    return
else
    inChars = num2str(n);
    if inChars(end) ~= '0'
        sl = sl + length(simpl{str2double(inChars(end))});
    end
    sl = sl + length(high{str2double(inChars(1))});
end
