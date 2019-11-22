function[winState] = winTest(bombArray, printArray, guess, numBombs)
%Tests the game outcome

[rows, cols] = size(bombArray);
winState = 0;
count = 0;

for(lcv = 1:rows)
      
  for(lcvNest = 1:cols)
        
    if(printArray(lcv, lcvNest) == 100)      
      count = count + 1;
    end
  end
end

if(bombArray(guess(1), guess(2)) == -1)
    winState = -1;
      
elseif(count == numBombs)
     winState = 1;
end

end

