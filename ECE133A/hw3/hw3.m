%% Hw 3: Textbook problems
% Author: Thomas Kost
% UID: 504989794
% Date: 1/29/21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc,clear,close all;
%% 3.1:Polynomial interpolation

n = [6, 11, 16];
polynomial_fit_plot = figure(1);
hold on;
for i =1:size(n,2)
    % find coefficeints
    t = linspace(-1,1,n(i))';
    y = 1 ./ (1 + 25*t.^2);
    A = fliplr(vander(t));
    x = A\y;
    
    % plot polynomials
    plot_x = linspace(-1,1, 1000);
    polynomial = 0;
    for m = 1:size(x,1)
        polynomial = (plot_x.^(m-1))*x(m) + polynomial;
    end
    plot(plot_x,polynomial);
end
% plot real values
t = linspace(-1,1,1000)';
y = 1 ./ (1 + 25*t.^2);
plot(t,y);
hold off;

% add plot documentation
legend("n = 6", "n = 11", "n = 16", "actual plot");
title("Polynomial Interpolation over n");
xlabel("t");
ylabel("y = f(t)");
saveas(polynomial_fit_plot, "polynomial_fit.jpg");

%% 3.4 :

A = [0,0,1, 0, 1,1; ...
     1,0,0, 1, 0,1; ...
     1,2,1, 1, 1,1; ...
     1,2,1,-1,-1,1; ...
     1,4,4, 1, 2,1; ...
     4,4,1, 2, 1,1;
    ];
b = [6,6,3,7,2,6]';
x = A\b;
formatSpec = 'P_{11} = %4.2f \nP_{12} = %4.2f \nP_{22} = %4.2f \nq_{1} =  %4.2f \nq_{2} = %4.2f \nr = %4.2f \n';
fprintf(formatSpec,x);

