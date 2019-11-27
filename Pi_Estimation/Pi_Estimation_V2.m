%Monte Carlo simulation to estimate pi

clear;
clf;
tic;

radius = 10;
iterations = 500;

range = 0:pi/50:2*pi;

xpoints = cos(range) * radius;
ypoints = sin(range) * radius;

figure(1)
set(gcf, 'Position', [500, 50, 325, 700]);
subplot(2, 1, 1)
plot(xpoints, ypoints, '-r'); %plots circle
title('Monte Carlo Hit Placement')
set(gca,'YTickLabel',[])
set(gca,'XTickLabel',[])
whitebg('k')

hold on
grid on

count = 0;
hits = 0;

subplot(2, 1, 2)
stE = text();
stC = text();
title('Distance from Pi: 3.14159')
set(gca,'XTickLabel',[])
hold on

while(count < iterations)
    xPoint = (-2 * radius) * rand(1) + radius;
    yPoint = (-2 * radius) * rand(1) + radius;
    
    drawnow limitrate
    if(xPoint ^ 2 + yPoint ^ 2 < radius ^ 2)
        subplot(2, 1, 1)
        plot(xPoint, yPoint, 'r.');
        hits = hits + 1;        
    else
        subplot(2, 1, 1)
        plot(xPoint, yPoint, 'b.');
    end
    
    count = count + 1;
    piEstimation = (hits / count) * 4;
    
    subplot(2, 1, 2)
    
    piDiff = piEstimation - pi;
        
    if(piDiff >= 0)
        plot(count, piDiff, '.g');
    else
        plot(count, piDiff, '.r');
    end    
 
    hold on
    ax = gca;
    ax.XAxisLocation = 'Origin';
    axis([1, count + 1, -0.25, 0.25]);
        
    delete(stE)
    delete(stC)
    
    strEst = ['Pi Estimation : ', num2str(piEstimation)];
    stE = text(0, 0.40, strEst, 'HorizontalAlignment', 'left');

    strCount = ['Iterations : ', num2str(count)];
    stC = text(0, 0.35, strCount, 'HorizontalAlignment', 'left');
    
    %strDiff = ['Error : ', num2str(piDiff)];
    %stD = text(0, 0, 
    
end
toc

piEstimation
    
    
    
    