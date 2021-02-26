# MATLAB Section

This section will provide the code and results for all relevant MATLAB problems for the midterm. 

## Code
The relevant code used to solve each problem is shown here. Note that the code is broken up and labeled by applicable problem.

```MATLAB
%%
 %  File: midterm.m
 % 
 %  Author: Thomas Kost
 %  
 %  Date: 06 February 2021
 %  
 %  @brief MATLAB solution to relevant midterm problems
 %
 clc, close all, clear;

 %% Problem 4:
 
 t= linspace(-0.75,0.25,7);
 y1 = 0;
 y2 = -0.1;
 y3 = 0.5;
 y5 = 1;
 y6 = 0.8;
 y7 = 0.5;
 
 b = [y1,y2,y3,y5,y6,y7,0,0]';
 vand_p = fliplr(vander(t(1:4)));
 vand_q = fliplr(vander(t(4:7)));
 vand_t4 = vand_p(4,:);
 vand_p = vand_p(1:3,:);
 vand_q = vand_q(2:4,:);
 t4 = t(4);
 t4_prime_vand = [0,1,2*t4, 3*(t4^2)];
 A = [vand_p, zeros(3,4);zeros(3,4), vand_q; vand_t4, -vand_t4;...
     t4_prime_vand, -t4_prime_vand];
 x = A\b;
 
 %% plot results
 x_axis = linspace(-0.75,0.25,1000);
 p = zeros(1,length(x_axis));
 q = zeros(1,length(x_axis));

 for m= 1:4
     p  = p + (x_axis.^(m-1))*x(m);
     q  = q + (x_axis.^(m-1))*x(m+4);
 end
 fig1 =figure;
 hold on;
 plot(x_axis, p);
 plot(x_axis, q);
 legend("p(t)", "q(t)");
 title("Plotting p(t) and q(t)");
 xlabel("t");
 ylabel("p(t), q(t)");
 saveas(fig1, "polynomial_plot.jpg");
     
 ```

 ## Results

 ### 4B:
 The resulting plot shows the graphs generated from solving the system of linear equations derived in the problem. We can see the two polynomials resulting plotted in the graph below:

 ![Figure 1](polynomial_plot.jpg)

 Our results make sense as at time step $t_{4}$ we can see that the graphs are tangent and coincident.