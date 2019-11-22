function[printArray] = setPrintArray(bombArray, guess, printArray)
%Sets the print array that is displayed to the user

[rows, cols] = size(bombArray);
rowSlot = guess(1);
colSlot = guess(2);
if(mod(rowSlot, 10) >= 1)
    
    if(bombArray(rowSlot, colSlot) == 0)

      for(lcv = (rowSlot - 1):(rowSlot + 1))

        for(lcvNest = (colSlot - 1):(colSlot + 1))

          if((lcv >= 1) && (lcv <= rows) && (lcvNest >= 1) && (lcvNest <= cols))

            if((bombArray(lcv, lcvNest) == 0) && (printArray(lcv, lcvNest) ~= 0))
              printArray(lcv, lcvNest) = 0;
              printArray = setPrintArray(bombArray, [lcv lcvNest], printArray); 

            elseif(bombArray(lcv, lcvNest) >= 1)
              printArray(lcv, lcvNest) = bombArray(lcv, lcvNest);
            end
          end
        end
      end
    else
      printArray(rowSlot, colSlot) = bombArray(rowSlot, colSlot);
    end
else
    printArray(rowSlot, colSlot) = 42;
end    
end


