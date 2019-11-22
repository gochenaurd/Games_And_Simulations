function[] = printResult(bombArray, printArray, winState, handles)
%Prints the result of the game

[rows, cols] = size(bombArray);

if(winState == 1)
    printPrintArray(printArray);
    fprintf('\nYou swept all the bombs!\n')
    fprintf('You win!\n')
    setText(printArray, handles, winState);
else
    fprintf('\n');
    fprintf('    ');

    for(lcvNumb = 1:cols)
        fprintf('%3d', lcvNumb);
    end
  
    fprintf('\n');
    fprintf('     --');

    for(lcvUnder = 1:(cols - 1))
        fprintf('---');
    end

    fprintf('\n');

    for(lcv = 1:rows)
        fprintf(' %2d |', lcv);

        for(lcvNest = 1:cols)
        
            if(bombArray(lcv, lcvNest) == -1)
                fprintf(' X ');
                printArray(lcv, lcvNest) = 50;
            elseif(printArray(lcv, lcvNest) == 100)
                fprintf(' - ');
            else
                fprintf('%2d ', printArray(lcv, lcvNest));
            end
        end
      fprintf('\n');
    end
    fprintf('\nYou hit a bomb and died!\n');
    fprintf('You lose.\n\n');
    
    setText(printArray, handles, winState);    
end

end

