%%
 %  File: hw7.m
 % 
 %  Author: Thomas Kost
 %  
 %  Date: 7 March 2021
 %  
 %  @brief homework 7 implementations
 %

 clear,clc,close all;
 %% 13.2 a: Least Squares
 [u,v] = robappr;
 A = [ones(length(u),1),u];
 alpha_beta = pinv(A)*v;
 
 %plotting
 
 fig1 = figure();
 line = linspace(min(u),max(u),1000);
 linear_fit = alpha_beta(1) + alpha_beta(2)*line;
 hold on;
 scatter(u,v);
 plot(line,linear_fit);
 %% 13.2 b: Newtons method
 
 % least squares loss function
 % sqrt((A*alpha_beta -v)'*(A*alpha_beta-v) + 25)
 cutoff_error= 10e-6;
 error = inf;
 itter =0;
 while(error >= cutoff_error)
%      h_in = A*alpha_beta - v;
%      mag = h_in'*h_in +25;
%      grad_coeff = 1/sqrt(mag);
%      hess_coeff = -(grad_coeff)^3;
%      gradient = A'*grad_coeff *h_in;
%      hess_first_term = A'*hess_coeff*(h_in*h_in')*A;
%      hess = hess_first_term + eye(length(hess_first_term))*grad_coeff;
%      alpha_beta = alpha_beta - pinv(hess)*gradient;
%      error = gradient'*gradient;
%      itter = itter + 1;
     
     gamma = A*alpha_beta - v;
     zeta = sqrt(gamma.*gamma +25);
     base_coeffs = 1./zeta;
     base_coeffs_cubed = base_coeffs.^3;
     gradient = [base_coeffs'*gamma; (base_coeffs.*u)'*gamma];
     hessian = [base_coeffs'*ones(length(u),1) ...
                - (base_coeffs_cubed.*gamma)'*gamma, ...
                base_coeffs'*u ...
                - (base_coeffs_cubed.*gamma)'*(gamma.*u); ...
                base_coeffs'*u ...
                - (base_coeffs_cubed.*gamma)'*(gamma.*u),...
                (base_coeffs.*u)'*u ...
                - (base_coeffs_cubed.*gamma.*u)'*(gamma.*u) ];
    alpha_beta = alpha_beta - pinv(hessian)*gradient;
    error = gradient'*gradient;
    itter = itter + 1;
 end
linear_fit = alpha_beta(1) + alpha_beta(2)*line;
plot(line,linear_fit);
hold off;
xlabel("U");
ylabel("V")
legend("data", "ls", "newton");
saveas(fig1, "p13_2_plot.jpg");

%%18.4: exponential fitting
x = [0,1,2,3,4,5];
y = [5.2,4.5,2.7,2.5,2.1,1.9];

error = inf;
theta = [0;0];
lambda = 10;
itter = 0;
while(error >= cutoff_error)
    % calculate jacobian
    J = ([ones(length(x),1),theta(1).*x'] .* exp(x'*theta(2)));
    f = theta(1)*exp(x'*theta(2))-y';
    theta_new = theta - pinv(J'*J + lambda*eye(length(theta)))*J'*f;
    f_new = theta_new(1)*exp(x'*theta_new(2))-y';
    J_new = ([ones(length(x),1),theta_new(1).*x'] .* exp(x'*theta_new(2)));
    if (f'*f > f_new'*f_new)
        lambda = 0.8*lambda;
        error = norm(J_new'*f_new);
        theta = theta_new;
    else
        lambda = 2*lambda;
        error = f'*f;
    end
   itter = itter +1; 
end
lin = linspace(0,5,1000);
result = theta(1)*exp(lin*theta(2));
fig2 = figure();
hold on;
scatter(x,y);
plot(lin, result);
hold off;
 