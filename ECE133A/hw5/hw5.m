%%
 %  File: hw5.m
 % 
 %  Author: Thomas Kost
 %  
 %  Date: 19 February 2021
 %  
 %  @brief homework 5 implementations
 %

 clear,clc,close all;
 %% 12.6 : equilizer
 
 c = [1,0.7,-0.3, -0.1, 0.05];
 n = size(c,2);
 T_c = convmtx(c,n)';
 I = eye(size(T_c,1));
 e1 = I(:,1);
 h = pinv(T_c)*e1;
 
 fig1 = figure(1);
 hold on;
 plot(c);
 plot(h);
 hold off;
 xlabel("index: n");
 ylabel("f(n)");
 legend("c","h");
 saveas(fig1, "c_and_h.jpg");
 fig2 = figure(2);
 plot(conv(h,c));
 xlabel("index: n");
 ylabel("f(n)");
 legend("c*h");
saveas(fig2, "conv.jpg");


%% 13.17: polynomial fitting
x = linspace(-1,1,11);
y = (1 + x)./(1 + 5*(x.^2));
fig3 =figure(3);
hold on;
for i = 1:9
    A = fliplr(vander(x));
    A = A(:,1:i);
    theta = pinv(A)*y';
    t = linspace(-1,1,1000)';
    polynomial = 0;
    for m = 1:size(theta,1)
        polynomial = (t.^(m-1))*theta(m) + polynomial;
    end
    plot(t,polynomial);
end

t = linspace(-1.1,1.1,1000)';
y = (1 +t) ./ (1 + 5*t.^2);
plot(t,y);
hold off;
legend("deg0","deg1","deg2","deg3","deg4","deg5","deg6","deg7","deg8","true");
saveas(fig3,"poly_plot.jpg");


 
 