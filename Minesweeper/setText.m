function[] = setText(printArrayNum, handles, winState)
%Sets the text shown in the GUI

rowSize = 9;
colSize = 9;

for(lcvRow = 1:rowSize)
    for(lcvCol = 1:colSize)
        printArray(lcvRow, lcvCol) = string(printArrayNum(lcvRow, lcvCol));
        
        if(printArray(lcvRow, lcvCol) == '100')
            printArray(lcvRow, lcvCol) = '   ';
        elseif(printArray(lcvRow, lcvCol) == '50' && winState == -1)
            printArray(lcvRow, lcvCol) = 'X';
        elseif(printArray(lcvRow, lcvCol) == '42')
            printArray(lcvRow, lcvCol) = '#';
        end
    end
end  

if(winState == 1)
    set(handles.resultBox, 'String', ' You swept all the bombs! You win!');
elseif(winState == -1)
    set(handles.resultBox, 'String', 'You hit a bomb and died. You lose.');
end

set(handles.push11, 'String', printArray(1, 1));
set(handles.push12, 'String', printArray(1, 2));
set(handles.push13, 'String', printArray(1, 3));
set(handles.push14, 'String', printArray(1, 4));
set(handles.push15, 'String', printArray(1, 5));
set(handles.push16, 'String', printArray(1, 6));
set(handles.push17, 'String', printArray(1, 7));
set(handles.push18, 'String', printArray(1, 8));
set(handles.push19, 'String', printArray(1, 9));

set(handles.push21, 'String', printArray(2, 1));
set(handles.push22, 'String', printArray(2, 2));
set(handles.push23, 'String', printArray(2, 3));
set(handles.push24, 'String', printArray(2, 4));
set(handles.push25, 'String', printArray(2, 5));
set(handles.push26, 'String', printArray(2, 6));
set(handles.push27, 'String', printArray(2, 7));
set(handles.push28, 'String', printArray(2, 8));
set(handles.push29, 'String', printArray(2, 9));

set(handles.push31, 'String', printArray(3, 1));
set(handles.push32, 'String', printArray(3, 2));
set(handles.push33, 'String', printArray(3, 3));
set(handles.push34, 'String', printArray(3, 4));
set(handles.push35, 'String', printArray(3, 5));
set(handles.push36, 'String', printArray(3, 6));
set(handles.push37, 'String', printArray(3, 7));
set(handles.push38, 'String', printArray(3, 8));
set(handles.push39, 'String', printArray(3, 9));

set(handles.push41, 'String', printArray(4, 1));
set(handles.push42, 'String', printArray(4, 2));
set(handles.push43, 'String', printArray(4, 3));
set(handles.push44, 'String', printArray(4, 4));
set(handles.push45, 'String', printArray(4, 5));
set(handles.push46, 'String', printArray(4, 6));
set(handles.push47, 'String', printArray(4, 7));
set(handles.push48, 'String', printArray(4, 8));
set(handles.push49, 'String', printArray(4, 9));

set(handles.push51, 'String', printArray(5, 1));
set(handles.push52, 'String', printArray(5, 2));
set(handles.push53, 'String', printArray(5, 3));
set(handles.push54, 'String', printArray(5, 4));
set(handles.push55, 'String', printArray(5, 5));
set(handles.push56, 'String', printArray(5, 6));
set(handles.push57, 'String', printArray(5, 7));
set(handles.push58, 'String', printArray(5, 8));
set(handles.push59, 'String', printArray(5, 9));

set(handles.push61, 'String', printArray(6, 1));
set(handles.push62, 'String', printArray(6, 2));
set(handles.push63, 'String', printArray(6, 3));
set(handles.push64, 'String', printArray(6, 4));
set(handles.push65, 'String', printArray(6, 5));
set(handles.push66, 'String', printArray(6, 6));
set(handles.push67, 'String', printArray(6, 7));
set(handles.push68, 'String', printArray(6, 8));
set(handles.push69, 'String', printArray(6, 9));

set(handles.push71, 'String', printArray(7, 1));
set(handles.push72, 'String', printArray(7, 2));
set(handles.push73, 'String', printArray(7, 3));
set(handles.push74, 'String', printArray(7, 4));
set(handles.push75, 'String', printArray(7, 5));
set(handles.push76, 'String', printArray(7, 6));
set(handles.push77, 'String', printArray(7, 7));
set(handles.push78, 'String', printArray(7, 8));
set(handles.push79, 'String', printArray(7, 9));

set(handles.push81, 'String', printArray(8, 1));
set(handles.push82, 'String', printArray(8, 2));
set(handles.push83, 'String', printArray(8, 3));
set(handles.push84, 'String', printArray(8, 4));
set(handles.push85, 'String', printArray(8, 5));
set(handles.push86, 'String', printArray(8, 6));
set(handles.push87, 'String', printArray(8, 7));
set(handles.push88, 'String', printArray(8, 8));
set(handles.push89, 'String', printArray(8, 9));

set(handles.push91, 'String', printArray(9, 1));
set(handles.push92, 'String', printArray(9, 2));
set(handles.push93, 'String', printArray(9, 3));
set(handles.push94, 'String', printArray(9, 4));
set(handles.push95, 'String', printArray(9, 5));
set(handles.push96, 'String', printArray(9, 6));
set(handles.push97, 'String', printArray(9, 7));
set(handles.push98, 'String', printArray(9, 8));
set(handles.push99, 'String', printArray(9, 9));

redButtons = findall(gcf, 'String', 'X');
set(redButtons, 'BackgroundColor', '[1 0.2 0.2]');

oneButtons = findall(gcf, 'String', '1');
set(oneButtons, 'ForegroundColor', 'b');
set(oneButtons, 'BackgroundColor', [0.95 0.95 0.95]);

twoButtons = findall(gcf, 'String', '2');
set(twoButtons, 'ForegroundColor', '[0.2 0.6 0.2]');
set(twoButtons, 'BackgroundColor', [0.95 0.95 0.95]);

threeButtons = findall(gcf, 'String', '3');
set(threeButtons, 'ForegroundColor', 'r');
set(threeButtons, 'BackgroundColor', [0.95 0.95 0.95]);

fourButtons = findall(gcf, 'String', '4');
set(fourButtons, 'ForegroundColor', [0.2 0 0.4]);
set(fourButtons, 'BackgroundColor', [0.95, 0.95, 0.95]);

fiveButtons = findall(gcf, 'String', '5');
set(fiveButtons, 'ForegroundColor', [0.5 0.1 0.05]);
set(fiveButtons, 'BackgroundColor', [0.95, 0.95, 0.95]);

sixButtons = findall(gcf, 'String', '6');
set(sixButtons, 'ForegroundColor', [0.15 0.15 0.15]);
set(sixButtons, 'BackgroundColor', [0.95, 0.95, 0.95]);

sevenButtons = findall(gcf, 'String', '7');
set(sevenButtons, 'ForegroundColor', [0.15 0.15 0.15]);
set(sevenButtons, 'BackgroundColor', [0.95, 0.95, 0.95]);

eightButtons = findall(gcf, 'String', '8');
set(eightButtons, 'ForegroundColor', [0.15 0.15 0.15]);
set(eightButtons, 'BackgroundColor', [0.95, 0.95, 0.95]);

zeroButtons = findall(gcf, 'String', '0');
set(zeroButtons, 'String', ' ');
set(zeroButtons, 'BackgroundColor', [0.95 0.95 0.95]);

end
