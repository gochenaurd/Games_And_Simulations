%Monte Carlo simulation to estimate pi

clear;
tic

radius = 10;
iterations = 1000000;

count = 0;
hits = 0;

while(count < iterations)
    xPoint = (-2 * radius) * rand(1) + radius;
    yPoint = (-2 * radius) * rand(1) + radius;
    
    if(xPoint ^ 2 + yPoint ^ 2 < radius ^ 2)
        hits = hits + 1;        
    end
    
    count = count + 1;
    piEstimation = (hits / count) * 4;    
end

toc
fprintf('PiEstimation is: %.7f', piEstimation)
    
    
    
    