function[bombArray] = setBombs(rowSize, colSize, numBombs, guess, bombArray)
%Sets the bombs in the bomb array

bombPlace = 0;

for(lcv = 1:numBombs)
    touchCheck = 0;

    randRow = randi([1 rowSize]);
    randCol = randi([1 colSize]);

    touchCheck = ((randCol == guess(2) && (randRow >= (guess(1) - 1)) && randRow <= (guess(1) + 1)));
    touchCheck = touchCheck + ((randCol == (guess(2) + 1)) && (randRow >= (guess(1) - 1) && randRow <= (guess(1) + 1)));
    touchCheck = touchCheck + ((randCol == (guess(2) - 1)) && (randRow >= (guess(1) - 1) && randRow <= (guess(1) + 1)));

    while(bombPlace ~= lcv)
        if((bombArray(randRow, randCol) ~= -1) &&  (touchCheck == 0))
            bombArray(randRow, randCol) = -1;
            bombPlace = bombPlace + 1;
        else
            touchCheck = 0;

            randRow = randi([1 rowSize]);
            randCol = randi([1 colSize]);

            touchCheck = ((randCol == guess(2) && (randRow >= (guess(1) - 1)) && randRow <= (guess(1) + 1)));
            touchCheck = touchCheck + ((randCol == (guess(2) + 1)) && (randRow >= (guess(1) - 1) && randRow <= (guess(1) + 1)));
            touchCheck = touchCheck + ((randCol == (guess(2) - 1)) && (randRow >= (guess(1) - 1) && randRow <= (guess(1) + 1)));
        end
    end
end
end
