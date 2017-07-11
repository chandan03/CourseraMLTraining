function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

hypothesis = X*theta;
J = sum(((hypothesis)-y).^2)/(2*m);
theta_without_1 = theta(2:end);
J = J + ((lambda/(2*m))*sum(theta_without_1 .^ 2));

grad = ((hypothesis - y)'*X)/m;
grad_without_1 = grad(2:end) + (theta_without_1*(lambda/m))';
grad = [grad(1),grad_without_1];


% =============================================================

end