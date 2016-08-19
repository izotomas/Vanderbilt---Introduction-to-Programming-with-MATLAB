%{
Each number on telephone keypads, except 0 and 1, corresponds to a set of uppercase letters
as shown in this list:
2ABC, 3DEF, 4GHI, 5JKL, 6MNO, 7PQRS, 8TUV, 9WXYZ
Hence, a phone-number specification can include uppercase letters and digits. 
Write a function called dial that takes as its input argument a string of length 16 or less 
that includes only these characters and returns as its output argument the telephone number 
as a uint64. Here is the input and output for one example of a call of the function:
Input: '1FUNDOG4YOU' Output: 13863644968
You can assume that a phone number never starts with 0. 
If the input contains any illegal characters, the function returns 0. 
You are not allowed to use the built-in function strrep.
%}

function num = dial(str)
[r,c] = size(str);
if  r > 1 || c > 16
    num = uint64(0);
    return
end
num = [];
for i = 1:length(str)
    n = toNum(str(i));
    if n > -1
        num = strcat(num,num2str(n));
    else
        num = uint64(0);
        return
    end
end
num = uint64(str2double(num));

function num = toNum(ch)
num = -1;
LEG = {'0','1','2ABC', '3DEF', '4GHI', '5JKL', '6MNO', '7PQRS', '8TUV', '9WXYZ'};
for i = 1:length(LEG(:))
    if strfind(LEG{i},ch) > 0
        num = i - 1; 
        return
    end
end
