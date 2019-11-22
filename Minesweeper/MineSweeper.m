%%This program is the Matlab version of Minesweeper

%Variable Declarations
rowSize = 9;
colSize = 9;
numBombs = 2;
gameWin = 1;
gameLoss = -1;
winState = 0;
bombArray = zeros(rowSize, colSize);

printOpening()

[printArray] = initialPrintArray(rowSize, colSize);
printPrintArray(printArray);

guess = input('\nEnter a starting row and column vector [row col]: ');

bombArray = setBombs(rowSize, colSize, numBombs, guess, bombArray);
bombArray = setCount(bombArray);
printArray = setPrintArray(bombArray, guess, printArray);

while((winState ~= gameWin) && (winState ~= gameLoss))
    
    %printPrintArray(bombArray)
    printPrintArray(printArray)
    
    guess = input('\nEnter a starting row and column vector [row col]: ');
    printArray = setPrintArray(bombArray, guess, printArray);
    
    winState = winTest(bombArray, printArray, guess, numBombs);
end

printResult(bombArray, printArray, winState);
