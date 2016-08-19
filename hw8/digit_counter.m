%{
Write a function called digit_counter that takes the name of a text file as input and returns 
the number of digits (i.e., any of the characters, 0-to-9) that the file contains. 
If there is a problem opening the file, the function returns -1. WARNING: if you use the ?w? flag 
with fopen, as opposed to ?r?, you will overwrite the file. The grader uses your own m files 
to check your function, so be careful!
%}

function n = digit_counter(filename)
file = fopen(filename,'r');
if file < 0
    n = -1;
    return
end
n = 0;
oneline = fgets(file);
while ischar(oneline)
    n = n + length(regexp(oneline,'\d'));
    oneline = fgets(file);
end
fclose(file);
end
