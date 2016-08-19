%{
Write a function called fence that takes two scalar inputs: 
lng, the length of a straight fence we need to build and seg, 
the length of one segment of fencing material. A segment needs to have 
a pole at both ends, but two neighboring segments always share a pole. 
The function returns two scalar outputs: the number of segments we need 
for the given length of fence and the number of poles needed. Note that a 
segment can be cut shorter if needed. For example, to build a 75m long straight 
fence using 10m segments, we need 8 segments. 
You may find the ceil built-in function handy.
%}

function [segments,poles] = fence(lng,seg)
segments = ceil(lng/seg);
poles = segments+1;