function guessMyNumber
x = input('Guess a number: ');
if x == 2 
    fprintf('Yeah baby!\n'); 
elseif x<2 || x>2
    fprintf('Wrong number, try again\n');
    guessMyNumber
end;