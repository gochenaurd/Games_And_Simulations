function[bombArray] = setCount(bombArray)
%Sets the numbers surrounding the bombs

[rows, cols] = size(bombArray);

for(lcv = 1:rows)

  for(lcvNest = 1:cols)
  
    if(bombArray(lcv, lcvNest) ~= -1)
    
      for(checkLcv = (lcv - 1):(lcv + 1))
      
        for(checkNest = (lcvNest - 1):(lcvNest + 1))
        
          if((checkLcv >= 1) && (checkLcv <= rows) && (checkNest >= 1) && (checkNest <= cols) && (bombArray(checkLcv, checkNest) == -1))
          
            bombArray(lcv, lcvNest) = bombArray(lcv, lcvNest) + 1;
          
          end
        end
      end
    end
  end
end
end

