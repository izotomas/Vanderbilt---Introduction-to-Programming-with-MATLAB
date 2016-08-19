%{
The function move_me is defined like this: function w = move_me(v,a). 
The first input argument v is a row-vector, while a is a scalar. 
The function moves every element of v that is equal to a to the end of the vector. 
For example, the command
>> x = move_me([1 2 3 4],2);
makes x equal to [1 3 4 2]. If a is omitted, the function moves occurrences of zeros.
%}

function w = move_me(v,a)
if nargin < 2
    a = 0;
end   
for i = 1:length(find(v == a))
  for j = find(v == a):length(v)-1
      v = swap(v,j,j+1);
  end
end
w = v;

% ALTERNATE SOLUTION
% w = [v(v ~= a) v(v == a)];

function A = swap(A, i, j)
temp = A(j);
A(j) = A(i);
A(i) = temp;
