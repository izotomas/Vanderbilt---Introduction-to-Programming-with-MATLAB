%{
Solve the inverse of the previous problem. That is, write a function called logipack that takes a 
square logical matrix as its only input argument and returns its cell vector representation as 
specified in the previous assignment. Note that empty array elements of the cell vector 
corresponding to rows with all false values must have a size of 0x0.
%}
function C = logipack(M)
[r,~] = size(M);
C = cell(1,r);
for i = 1:r
   C{i} = find(M(i,:));
   if isempty(C{i})      % find 1x0 arrays
     C{i} = [];          % make it 0x0
   end
end