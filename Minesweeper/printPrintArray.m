function[] = printPrintArray(printArray)
%Prints the print array

[rows, cols] = size(printArray);

fprintf('\n')
fprintf('   ')

for(lcvNumb = 1:cols)
    fprintf('%3d', lcvNumb);
end

fprintf('\n');
fprintf('    --')

for(lcvUnder = 1:cols - 1)
    fprintf('---')
end

fprintf('\n');

for(rowLcv = 1:rows)
    fprintf('%2d |', rowLcv)
    
    for(colLcv = 1: cols)
        if(printArray(rowLcv, colLcv) ~= 100)
            fprintf("%2d ", printArray(rowLcv, colLcv))
        else
            fprintf(" - ")
        end
    end
    fprintf("\n")
end

end

