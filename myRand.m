function [a,s] = myRand(low,high)
a = low+rand(3,4)*(high-low);
s = sumAllelements(a);


function summ = sumAllelements(M)
v = M(:);
summ = sum(v);