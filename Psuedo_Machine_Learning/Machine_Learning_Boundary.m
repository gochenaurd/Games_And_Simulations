%% Machine Learning Boundary Boundary Solver Demonstration

%clear all;
close;
clf;

% Variable Declarations
dataPoints = 200;
quadrantSize = 10;
maxIterations = 100;

% Generate Random Boundary Curve
drawCurveY = zeros(2, 1);
halfQuad = quadrantSize / 2;
b = rand(1) * quadrantSize;
maxA = (quadrantSize - b) / quadrantSize;
minA = -b / quadrantSize;
a = minA + (maxA - minA) * rand(1);
drawCurveY(1) = b;
drawCurveY(2) = a * quadrantSize + b;

% Set Random Data Point Location
dataXLoc = zeros(dataPoints, 1);
dataYLoc = zeros(dataPoints, 1);

for(pointPlace = 1:dataPoints)
    dataXLoc(pointPlace) = rand(1) * quadrantSize;
    dataYLoc(pointPlace) = rand(1) * quadrantSize;   
end

% Plot Simulation Data Points and Boundary Curve
dataVal = zeros(dataPoints,1);

figure(1)
set(gcf, 'Position', [375, 90, 750, 600]);
set(gca, 'Position', [0.07, 0.10, 0.7, 0.8])

for(n = 1:dataPoints)
    dataBoundVal = dataXLoc(n) * a + b;
    if(dataYLoc(n) >= dataBoundVal)
        plot(dataXLoc(n), dataYLoc(n), 'ro')
        dataVal(n) = 1;
    else
        plot(dataXLoc(n), dataYLoc(n), 'bo')
        dataVal(n) = 0.5;
    end
    hold on    
end

guessA = 0;
guessB = 5;
iterations = 1;

while(iterations < maxIterations)
    tic
    changeTest = 0;
    for(i = 1:dataPoints)
        dataGuessBoundVal = guessA * dataXLoc(i) + guessB;
        if(dataYLoc(i) >= dataGuessBoundVal)
            guess = 1;
        else
            guess = 0.5;
        end
        
        if(guess ~= dataVal(i))
            if(dataGuessBoundVal < dataYLoc(i))
                moveDist = (dataYLoc(i) - dataGuessBoundVal) * 1.2;
                if((iterations / 2) == round(iterations / 2))
                    if(dataXLoc(i) < quadrantSize / 2)
                        guessA = guessA - 0.1 / iterations;
                    else
                        guessA = guessA + 0.1 / iterations;
                    end
                else
                    guessB = guessB + moveDist;
                end
            else
                moveDist = (dataYLoc(i) - dataGuessBoundVal) * 1.2;
                if((iterations / 2) == round(iterations / 2))
                    if(dataXLoc(i) < quadrantSize / 2)
                        guessA = guessA + 0.1 / iterations;
                    else
                        guessA = guessA - 0.1 / iterations;
                    end
                else
                    guessB = guessB + moveDist;
                end
            end  
            changeTest = 1;
        end
    end
    
    iterations = iterations + 1;
    oldIterations = iterations;
    
    if (changeTest == 0)
        oldIterations = iterations;
        iterations = maxIterations + 1;
        outcomeText = text(11.8, 3.75, 'Success', 'FontSize', 11);
    end
    
    figure(1)
    
    if(iterations >= 3)
        %set(colorRedRegion, 'visible', 'off');
        delete(colorRedRegion)
        %set(colorBlueRegion, 'visible', 'off');
        delete(colorBlueRegion)
        %set(guessPlot, 'visible', 'off');
        delete(guessPlot)
        delete(iterText)
        delete(eqText)
    end
    
    drawGuessY(1) = guessB;
    drawGuessY(2) = guessA * quadrantSize + guessB;
    
    guessPlot = plot([0; quadrantSize], drawGuessY, '-m');
    
    xRegion = [0; quadrantSize; quadrantSize; 0];
    yRedRegion = [guessB; quadrantSize * guessA + guessB; quadrantSize; quadrantSize];
    yBlueRegion = [guessB; quadrantSize * guessA + guessB; 0; 0];
    
    colorRedRegion = patch(xRegion, yRedRegion, 'r', 'FaceAlpha', 0.35);
    colorBlueRegion = patch(xRegion, yBlueRegion, 'b', 'FaceAlpha', 0.35);
    
    set(colorRedRegion, 'visible', 'on');
    set(guessPlot, 'visible', 'on');
    
    axis([0 quadrantSize 0 quadrantSize]);
    title('Linear Boundary Evolution for a Classification Neutral Network', 'FontSize', 12.5);
    grid on;
    
    iterHandle = ['Iterations : ', num2str(oldIterations)];
    iterText = text(10.75, 6.25, iterHandle, 'FontSize', 12);
    eQHeadText = text( 10.5, 5.25, 'Boundary Guess : ', 'FontSize', 11);
    eqHandle = ['y = ', num2str(guessA,'%.2f'), 'x + ', num2str(guessB,'%.2f')];
    eqText = text(10.65, 4.75, eqHandle, 'FontSize', 11);
    outcomeHead = text(10.4, 3.75, 'Outcome : ', 'FontSize', 11);
    
    iterateTime = toc;
    
    if(iterateTime < 0.24)
        pause(0.24 - iterateTime)
    end
    
    toc
end

if(oldIterations == maxIterations)
    outcomeText = text(11.8, 3.75, 'Failure', 'FontSize', 11);
end

fprintf('\nFinal Guess Boundary: y = %.2fx + %.2f', guessA, guessB)
fprintf('\nOriginal Boundary: y = %.2fx + %.2f\n', a, b)
fprintf('Iterations: %d\n\n', oldIterations)



