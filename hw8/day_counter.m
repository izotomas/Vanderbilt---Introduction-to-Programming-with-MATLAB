%{
Write a function called day_counter that returns the number of Mondays that fell on the first day of 
the month in a given year between 1776 and 2016 inclusive where the requested year is the only input 
to your function and it is a positive integer scalar. Note that a leap year occurs on any year evenly 
divisible by 4, but not on a century unless it is divisible by 400. In a leap year, February has 29 
days. You are not allowed to use the datenum built-in function. (Inspired by Project Euler.)
%}

function n = day_counter(year)
n = 0;
for i = 1:12
    d = day(datetime(year,i,1),'name');
    if  isequal(d{1},'Monday')
        n = n + 1;
    end
end
