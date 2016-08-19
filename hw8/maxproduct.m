%{
Write a function called maxproduct that takes a matrix A and a positive integer scalar
n as inputs and computes the largest product of n adjacent elements in the same
direction in A. That is, we are looking for products of consecutive elements in the
same row, column, diagonal or reverse diagonal. The function must return an n-by-2
matrix containing the row and column indexes ordered first by row and then by column.
If no such product exists, the function returns the empty array. For example,
valid outputs for a max product of 3 neighbors in four different matrices might
be [2 2; 2 3; 2 4] or [1 1; 2 1; 3 1] or [3 5; 4 4; 5 3] or [4 2; 5 3; 6 4].
If there are multiple products with the same maximum value, return the first one you
find. (Inspired by Project Euler.)

MY UGLY SOLUTION - BETTER SOLUTION IS AT BOTTOM

function M = maxproduct(A,n)
[r, c] = size(A);
maxProd = realmin;
M = zeros(n,2);
if n > r && n > c
    M = [];
    return
end
if n == 1 && r == 1 && c == 1
   [a, b] =  find(A==(max(max(A))));
    M(1,1) = a;
    M(1,2) = b;
    return
end
if r == 1 || c == 1
    T = A(:);
    for i = 1: length(A)+1-n
        tempsum = prod(T(i:i+n-1,1));
        if tempsum > maxProd
            maxProd = tempsum;
            for k = 1:n
                M(k,1) =  1;
                M(k,2) =  i + k - 1;
            end 
        end
    end
    if c == 1
        M = fliplr(M);
    end
    return
end
%% check row products
for i = 1:r
    for j = 1:c-n+1
        tempsum = prod(A(i,j:j+n-1));
        if tempsum > maxProd
            maxProd = tempsum;
            for k = 1:n
                M(k,1) =  i;
                M(k,2) =  j + k - 1;
            end
        end
    end
end

%% check col products
for i = 1:c
    for j = 1:r-n+1
        tempsum = prod(A(j:j+n-1,i));
        if tempsum > maxProd
            maxProd = tempsum;
            for k = 1:n
                M(k,2) =  i;
                M(k,1) =  j + k - 1;
            end
        end
    end
end

%% check diagonals, start from bottom left
rstart = n - r; %set starting point to min possible value
DL = [];
while length(diag(A,+rstart)) >= n
    DL = [DL length(diag(A,+rstart))]; % WILL USE LATER TO CREATE OPPOSITE DIAGONALS
    tempv = diag(A,+rstart)';
    for i = 1:length(tempv)-n+1
        tempsum = prod(tempv(i:i+n-1));
        if tempsum > maxProd
            maxProd = tempsum;
            if rstart < 0
                rCor = 1 - rstart;
                yCor = i;
            else
                rCor = 1;
                yCor = 1 + rstart;
            end
            for k = 1:n
                M(k,1) =  rCor;
                M(k,2) =  yCor;
                rCor = rCor + 1;
                yCor = yCor + 1;
            end
        end
    end
    rstart = rstart + 1;
end
clear rCor yCor k tempsum rstart;
%% check diagonals, start from top left
%%build diagonal
sRow = n; %set starting point to min possible value
for i = 1:length(DL)
    if sRow >= r
        row = r;
        col = 1 + sRow - r;
    else
        row = sRow;
        col = 1;
    end
    tempv = [];
    for j = 1:DL(i)
        tempv = [tempv A(row,col)];
        row = row - 1;
        col = col + 1;
    end
    %get products and compare them
    for k = 1:length(tempv)-n+1
        if sRow >= r
            rCor = r;
            yCor = 1 + sRow - r;
        else
            rCor = sRow;
            yCor = 1;
        end
        tempsum = prod(tempv(k:k+n-1));
        if tempsum > maxProd
            maxProd = tempsum;
            for l = 1:n
                M(l,1) =  rCor;
                M(l,2) =  yCor;
                rCor = rCor - 1;
                yCor = yCor + 1;
            end
            M = flipud(M);
        end
    end
    sRow = sRow + 1;
end
end

%}

function B = maxproduct(A,n)

% After checking that we do not have to return an empty array, we initialize a row vector
% for remembering a product, home row and column, and one of four direction codes.
% Home is a location in the matrix from which we can move in one of the directions
% (1=East, 2=South, 3=SouthEast, 4=SouthWest). For each direction, home is systematically 
% moved to everywhere it legally can be the start of n values. For each location, we 
% potentially update the L vector with the largest product so far, the home location and
% direction that corresponded to that product. After scanning in all four directions, we 
% use L to reconstruct the required indices based on the last updated home and direction. 

  [r,c] = size(A);
  if n>r && n>c
    B = [];                                  % cannot be solved
    return
  end
  global L;
  L = zeros(1,4);                            % [product, home-row, home-col, direction]
  for i=1:r                            
    for j=1:c-n+1
      check(A(i,j:j+n-1),[i,j,1]);           % row, right case
    end
  end 
  for i=1:r-n+1                        
    for j=1:c
      check(A(i:i+n-1,j),[i,j,2]);           % column, down case
    end
  end
  for i=1:r-n+1
    for j=1:c-n+1
      S=A(i:i+n-1,j:j+n-1);
      check(diag(S),[i,j,3]);                % diagonal, down case
      check(diag(flip(S,2)),[i,j,4]);        % reverse diagonal, down case
    end
  end
  i=L(2); j=L(3);                            % reconstruct coordinates
  switch L(4)                                  
    case 1, B = [ones(n,1)*i,(j:j+n-1)'];      
    case 2, B = [(i:i+n-1)',ones(n,1)*j];
    case 3, B = [(i:i+n-1)',(j:j+n-1)'];
    case 4, B = [(i:i+n-1)',(j+n-1:-1:j)'];
  end
end

function check(V,d)
  global L;  
  p = prod(V);
  if p>L(1)                                % if new product larger than any previous
    L = [p,d];                             % then update product, home and direction 
  end  
end



