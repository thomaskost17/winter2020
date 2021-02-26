---
documentclass:
- article
geometry:
- top=1in
- left=1in
---

# ECE 133A Hw3 Matlab section

Thomas Kost     | UID: 504989794

## Introduction

This document will be broken into two main sections: a section containing the relevant code, and a section discussing all relevant results.

## MATLAB Code

This section contains all relevant MATLAB code for this homework assignment. Note that the code is labeled by homework problem requiring MATLAB.

```MATLAB
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
```

## Results:

### 3.1 : Polynomial Interpolation
The following figure shows the result for polynomial interpolation over given vlaues of n (stated in Figure 1). We should also note that the actual function is also plotted for reference of the error present in each polynomial approximation.
![Figure 1](polynomial_fit.jpg)
We can see from Figure 1 that increasing the degree of the polynomial interpolatino will reduce the error of the function about 0, but will result in large errors as we move away from this point. Smaller degree polynomials lack these higher frequency components and while they have a larger error at $t =0$ they produce a come consistent result at larger magnitudes of $t$. 

This is reminiscent of the effect we see when taylor approximating about zero.

### 3.4 answer

The matlab script for this portion of the question output the following result:
$$ P_{11} = 3.00 $$
$$ P_{12} = -2.00 $$
$$ P_{22} = 1.00 $$
$$ q_{1} =  -2.00 $$
$$ q_{2} = 0.00 $$
$$ r = 5.00 $$
The relevant matrix equation can be seen in the MATLAB code and in the handwritten portion.